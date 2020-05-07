//
//  LoginController.swift
//  FunVideo
//
//  Created by yang wenjie on 2020/3/9.
//  Copyright © 2020 yang wenjie. All rights reserved.
//

import UIKit
import SnapKit

class LoginController: UIViewController {

    lazy var tipLabel : UILabel = {
        let obj = UILabel()
        obj.textColor = UIColor.black
        obj.font = UIFont.systemFont(ofSize: 30)
        obj.textAlignment = .center
        obj.text = "帐号登录"
        return obj
    }()
    
    lazy var userNameLabel : UILabel = {
        let obj = UILabel()
        obj.textColor = UIColor.black
        obj.font = UIFont.systemFont(ofSize: 20)
        obj.textAlignment = .center
        obj.text = "帐号"
        return obj
    }()
    lazy var userNameField : UITextField = {
        let obj = UITextField()
        obj.returnKeyType = .done
        obj.attributedPlaceholder = NSAttributedString(string: "邮箱/饭否帐号",
                                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 165/255.0, green: 165/255.0, blue: 166/255.0, alpha: 1.0),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 19)])
//        obj.delegate = self
        
        
//        placeholderAttributes[NSFontAttributeName] = font
        
        
        
//        "请输入账号"
      
        return obj
    }()
    lazy var nameLine : UIView = {
        let obj = UIView()
        obj.backgroundColor = UIColor.init(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 0.35)
        
      return obj
    }()
    
    lazy var passWordLabel : UILabel = {
        let obj = UILabel()
        obj.textColor = UIColor.black
        obj.font = UIFont.systemFont(ofSize: 20)
        obj.textAlignment = .center
        obj.text = "密码"
        return obj
    }()
    lazy var passWordField : UITextField = {
        let obj = UITextField()
        obj.returnKeyType = .done
//        obj.delegate = self
        obj.attributedPlaceholder = NSAttributedString(string: "请填写密码",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor.init(red: 165/255.0, green: 165/255.0, blue: 166/255.0, alpha: 1.0),NSAttributedString.Key.font:UIFont.systemFont(ofSize: 19)])
      
        return obj
    }()
    lazy var passWordLine : UIView = {
        let obj = UIView()
        obj.backgroundColor = UIColor.init(red: 200/255.0, green: 200/255.0, blue: 200/255.0, alpha: 0.35)
        
      return obj
    }()
    
    // 确认按钮
    lazy var sureButton: UIButton = {
        let sureButton = UIButton()
        sureButton.setTitle("登录", for: UIControl.State.normal)
        sureButton.backgroundColor = UIColor(red: 224/255.0, green: 225/255.0, blue: 224/255.0, alpha: 1.0)
        sureButton.setTitleColor(UIColor.init(red: 165/255.0, green: 165/255.0, blue: 166/255.0, alpha: 1.0), for: UIControl.State.normal)
        sureButton.layer.cornerRadius = 5
        sureButton.layer.masksToBounds = true
        sureButton.titleLabel?.font = UIFont.systemFont(ofSize: 19)
        sureButton.addTarget(self, action: #selector(self.loginClick), for: UIControl.Event.touchUpInside)
        return sureButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.init(red: 236/255.0, green: 237/255.0, blue: 236/255.0, alpha: 1.0)
        navigationController?.setNavigationBarHidden(true, animated: false)
        configUI()
    }
    
    func configUI() {
        self.view.addSubview(self.tipLabel)
        self.view.addSubview(self.userNameLabel)
        self.view.addSubview(self.userNameField)
        self.view.addSubview(self.passWordLabel)
        self.view.addSubview(self.passWordField)
        self.view.addSubview(self.nameLine)
        self.view.addSubview(self.passWordLine)
        self.view.addSubview(self.sureButton)
        tipLabel.snp.makeConstraints { (make) in
            make.left.equalTo(30)
            make.top.equalTo(100)
        }
        userNameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(28)
            make.size.width.equalTo(50)
            make.top.equalTo(self.tipLabel.snp.bottom).offset(50)
        }
        userNameField.snp.makeConstraints { (make) in
            make.left.equalTo(self.userNameLabel.snp.right).offset(50)
            make.right.equalTo(-30)
            make.centerY.equalTo(self.userNameLabel.snp.centerY)
        }
        nameLine.snp.makeConstraints { (make) in
            make.left.equalTo(28)
            make.right.equalTo(-30)
            make.top.equalTo(userNameLabel.snp.bottom)
            make.size.height.equalTo(0.8)
        }
        passWordLabel.snp.makeConstraints { (make) in
            make.left.equalTo(28)
            make.size.width.equalTo(50)
            make.top.equalTo(userNameLabel.snp.bottom).offset(10)
        }
        passWordField.snp.makeConstraints { (make) in
            make.left.equalTo(self.passWordLabel.snp.right).offset(50)
            make.right.equalTo(-30)
            make.centerY.equalTo(self.passWordLabel.snp.centerY)
        }
        passWordLine.snp.makeConstraints { (make) in
            make.left.equalTo(28)
            make.right.equalTo(-30)
            make.top.equalTo(passWordLabel.snp.bottom)
            make.size.height.equalTo(0.8)
        }
        sureButton.snp.makeConstraints { (make) in
            make.left.equalTo(28)
            make.right.equalTo(-28)
            make.top.equalTo(passWordLine.snp.bottom).offset(100)
            make.size.height.equalTo(50)
        }
    }
}

extension LoginController {
    @objc func loginClick() {
        let name = userNameField.text ?? ""
        let passWord = passWordField.text ?? ""
        
        if name.count == 0 || passWord.count == 0 {
            return
        }
        let loginService = LoginService()
        loginService.loginIdentifi(userName: name, passWord: passWord)
    }
}

