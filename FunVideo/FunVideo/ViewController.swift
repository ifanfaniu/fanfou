//
//  ViewController.swift
//  FunVideo
//
//  Created by yang wenjie on 2019/9/11.
//  Copyright © 2019 yang wenjie. All rights reserved.
//

import UIKit
/// swift 练习项目
/// 1.封装tabbar
/// 2.封装navigationbar
/// 3.常用UI控件及语法知识
/// 4.AV Foundation使用
protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T:AnyObject>:TargetAction {
    weak var target: T?
    let action: (T) -> () -> ()
    
    func performAction() -> () {
        if let t = target {
            action(t)()
        }
    }
}

class Control {
    var actions = [ControlEvent: TargetAction]()
    
    func setTarget<T:AnyObject>(target:T,
                                action:@escaping(T) -> () -> (),
                                controlEvent: ControlEvent) {
        actions[controlEvent] = TargetActionWrapper(target: target, action: action)
    }
    
    func removeTargetForControlEvent(controlEvent:ControlEvent) {
        actions[controlEvent] = nil
    }
    
    func performActionForControlEvent(controlEvent:ControlEvent) {
        actions[controlEvent]?.performAction()
    }
    
    init(uu:String) {
        
    }
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
}

class ViewController: UIViewController {
    
    convenience init(text: String) {
        self.init()
        print("****\(text)")
    }
    
    
    
    lazy var sss:UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = #imageLiteral(resourceName: "编组 2")
        imageView.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer.init(target: self, action: Selector(("tapImageClick")))
        imageView.addGestureRecognizer(tapGesture)
        return imageView
    }()
    
    let button = Control(uu: "qw")
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        // Do any additional setup after loading the view.
        
        button.setTarget(target: self, action: ViewController.onButtonTap, controlEvent: .TouchUpInside)
        
        view.addSubview(sss)
        
        enterMethod()
        
        ergodicElement()
        
        operationAdd()
    }
    
    @objc func tapImageClick() {
        let studyVC = FVStudySwiftVC(text: "没错的偶遇")
        
        self.navigationController?.pushViewController(studyVC, animated: true)
//        self.show(studyVC, sender: studyVC)
    }
    
    func onButtonTap() {
        print("Button was tapped")
    }
    
    ///方法入口
    func enterMethod() {
        
        let addThree = addTo(3)(5)
//        let result = addThree(5)
        print("***\(String(describing: addThree))")
        
        //用于比较大小的值
        let greaterThan100 = greaterThan(100)
        if greaterThan100(101) {
            print("大于")
        }
        
    }
    
    
    
    /// Currying (柯里化) 作用：批量制造相似方法的工具，避免写重复代码
    // MARK: - “_” 可以忽略方法的外部名
    
    // simple 1 加法操作
    func addTo(_ adder: Int) -> (Int) -> Int {
        return {
            num in
            return num + adder
        }
    }
    
    // simple 2 比较大小操作
    func greaterThan(_ comparer: Int) -> (Int) -> Bool {
        return { $0 > comparer }
    }

}
extension ViewController {
    
    func ergodicElement() {
        let arr = [0,1,2,3,4]
        
        for i in ReverseSequence(array: arr) {
            print("Index\(i)is\(arr[i])")
        }
    }
}

class ReverseIterator<T>: IteratorProtocol {
    
    typealias Element = T
    
    var array: [Element]
    var currentIndex = 0
    
    init(array: [Element]) {
        self.array = array
        currentIndex = array.count - 1
    }
    
    // 寻找前一个值
    func next() -> Element? {
        if currentIndex < 0 {
            return nil;
        }
        else {
            let element = array[currentIndex]
            currentIndex -= 1
            return element
        }
    }
}

class ReverseSequence<T>: Sequence {
    var array: [T]
    
    init(array: [T]) {
        self.array = array
    }
    
    typealias Iterator = ReverseIterator<T>
    
    __consuming func makeIterator() -> ReverseIterator<T> {
        return ReverseIterator(array: self.array)
    }
        
}

extension Sequence {
    
   
//    func map<T>(_ transform:(Self.Iterator.Element) throws -> T) rethrows -> [T]
    
//    func filter(_ isIncluded:(Self.Iterator.Element) throws -> Bool)
//
//    func reduce<Result>(_ initialResult: Result, _ nextPartialResult:(partialResult: Result, Self.Iterator.Element) throws -> Result) rethrows -> Result
    
    
}


//1.问号？
//a.声明时添加？，告诉编译器这个是Optional的，如果声明时没有手动初始化，就自动初始化为nil
//b.在对变量值操作前添加？，判断如果变量时nil，则不响应后面的方法。
//2.叹号！
//a.声明时添加！，告诉编译器这个是Optional的，并且之后对该变量操作的时候，都隐式的在操作前添加！
//b.在对变量操作前添加！，表示默认为非nil，直接解包进行处理


//noescape是非逃逸
//@noescape关键字代码中扮演了一个标注的作用：来说明一个闭包参数，该闭包参数与此API是同步的，它只在此API中被调用。只要该API运行结束，该闭包的生命周期就结束
//上面的论述，只有在闭包是临时创建，即没有被API外部的任何其他属性或全局变量持有的前提下才成立！！


extension ViewController {
    
    func operationAdd() {
        let m = 3.0
        let n = 2.0
        let o = m+n
        print("***\(o)***")

        let v1 = Vector2D(x: 1.0, y: 3.0)
        let v2 = Vector2D(x: 4.0, y: 3.0)
        let v3 = v1+v2
        print("****\(v3)****")
    }
    
}

