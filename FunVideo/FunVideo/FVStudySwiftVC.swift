//
//  FVStudySwiftVC.swift
//  FunVideo
//
//  Created by yang wenjie on 2019/12/17.
//  Copyright © 2019 yang wenjie. All rights reserved.
//

import UIKit

class FVStudySwiftVC: UIViewController {
    
    /// 构造方法
// 1.指定构造器（Designated Initializers）
//
// 2.便利构造器（Convenience Initializers）
//
  
// 由于Swift的内存安全，在调用父类构造方法之前，确保对本类的所有存储属性进行初始化
// Two-Phase Initialization（两段式构造）
// 1.初始化所有的存储属性。
// 2.它给每个类一次机会，在新实例准备使用之前进一步自定义它们的存储型属性。
    
    
    convenience init(text: String) {
        self.init()

        print("****\(text)")
    }
    
    /// life circle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        
        let rect = CGRect(x: 0, y: 0, width: 100, height: 100)
//        rect.contains(<#T##point: CGPoint##CGPoint#>)
        
        
        /// Tuple多元组
        /// 1. 数据交换
        var a = "www"
        var b = "hhhh"
        swapMe(a: &a, b: &b)
        print("+++\(a)++++\(b)")
        /// 2.用于返回多值
//        _ = CGRect(x: 0, y: 0, width: 100, height: 100)
        let (small, large) = rect.divided(atDistance: 10, from: .minXEdge)
        print("+++\(small)++++\(large)")
        
        /// @autoclosure和 ??
        logIfTrue{0 < 1}
        logIfFalse(0 > 1)
        
        if 1==2 && 3==4 {
            
        }
        
        operationAdd()
        
        distance(from: <#T##CGPoint#>, to: <#T##CGPoint#>)
        
    }
    
    /// inout 修饰符，表示按值传递
    /// closure是通过截获外部变量的引用从而实现对变量的修改的
    /// 方法参数用 inout 修饰可以在方法内对参数直接进行修改
    func swapMe<T>(a:inout T, b:inout T) {
        (a, b) = (b, a)
    }
    
    ///
    func logIfTrue(_ predicate:() -> Bool) {
        if predicate() {
            print("True")
        }
    }
    /// trailing closure 尾随闭包, 闭包是方法的最后一个参数
    
    /// @autoclosure 不支持带有输入参数的写法
    func logIfFalse(_ predicate: @autoclosure() -> Bool) {
        if predicate() {
            print("False")
        }
    }
    

    /// 实现??方法
    func emptyJudge<T>(optional:T?, defaultValue:@autoclosure() -> T) -> T {
        switch optional {
        case .some(let value):
            return value
        case .none:
            return defaultValue()
        }
    }
    
    /// 实现&&方法
    func andJudge(lhs: Bool, rhs: @autoclosure () throws -> Bool) rethrows -> Bool {
        if lhs {
            return try rhs()
        }
        else {
            return false
        }
    }
    
    
    
    
    


}


/// required的作用
// 将父类中convenience initializer所依赖的
// designated initializer标记为required，
// 我们就可以通过该convenience initializer初始化子类了。

//class Person {
//    let name : String
//
//    /// 指定构造器designated initializer， 用r
//    required init(name: String) {
//
//    }
//
//}


/// ****tips****
// final类没有子类
// @escaping 逃逸闭包
// 协议或者父类里面定义一个接受 @escaping 为参数的方法，那么在实现协议或者这个父类的子类，
// 对应的方法也必须被声明为 @eascping

protocol P {
    func work(block: @escaping()->())
}

class C: P {
    func work(block: @escaping () -> ()) {
        DispatchQueue.main.async {
            
        }
    }
}

/// ****重载操作符****
struct Vector2D {
    var x = 0.0
    var y = 0.0
}

func +(left: Vector2D,right: Vector2D) -> Vector2D {
    return Vector2D(x: left.x + right.x, y: left.y + right.y)
}

extension FVStudySwiftVC {
    
    
    func operationAdd() {
        let v1 = Vector2D(x: 1.0, y: 3.0)
        let v2 = Vector2D(x: 4.0, y: 3.0)
        let v3 = v1+v2
        print("***\(v3)***")
    }
    
    func incrementor(variable: Int) -> Int {
        
//        print(variable)
        return variable + 1
    }
    
}


/// ****tips****
// swift里面默认声明方式为let


/// ****写一个Array的extension****
extension Array {
    public subscript(input: [Int]) -> ArraySlice<Element> {
        get {
            var result = ArraySlice<Element>()
            for i in input {
                assert(i < self.count, "Index out of range")
                result.append(self[i])
            }
            return result
        }
        
        set {
            for (index,i) in input.enumerated() {
                assert(i < self.count, "Index out of range")
                self[i] = newValue[index]
            }
        }
    }
}

/// ****tips****
// 1.所有结构体和枚举值类型都是值类型
//
// 2.使用mutating关键字放在枚举或结构体中所定义方法的func关键字之前，
// 使得该方法可以在方法中修改枚举或结构体的属性
//
// 3.swift，方法里面能定义方法
//

extension FVStudySwiftVC {
    
    func distance(from point: CGPoint, to anotherPoint: CGPoint) -> Double {
        let dx = Double(anotherPoint.x - point.x)
        let dy = Double(anotherPoint.y - point.y)
        return sqrt(dx * dx + dy * dy)
    }
    
    typealias Location = CGPoint
    typealias Distance = Double
    
    func distanceType(from location: Location, to anotherLocation: Location) -> Distance {
        let dx = Distance(location.x - anotherLocation.x)
        let dy = Distance(location.y - anotherLocation.y)
        return sqrt(dx * dx + dy * dy)
    }
}

/// ****tips****
// 协议
protocol Food {
    
}

protocol Animal {
    func eat(_ food: Food)
}

struct Meat: Food {}
struct Grase: Food {}

struct Tiger: Animal {
    func eat(_ food: Food) {
        if let meat = food as? Meat {
            print("eat\(meat)")
        }
        else {
            fatalError("Food is not meat")
        }
    }
}


