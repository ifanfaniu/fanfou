//
//  LoginService.swift
//  FunVideo
//
//  Created by yang wenjie on 2020/4/7.
//  Copyright © 2020 yang wenjie. All rights reserved.
//

import UIKit
import Alamofire

class LoginService: NSObject {
// x_auth_username: 用户名字段，可以传递饭否登录名以及登录邮件
// x_auth_password: 密码字段，目前只支持明文方式
// x_auth_mode: 标识字段，填入"client_auth" 即可
// 需要注意的是，
// oauth_signature字段必须对以上三个x_auth字段一并校验签名。
    // Alamofire 4
    
    
    let consumer_key = "b7487f88d14f05b4f017e8037d19b14b" // api key
    let consumer_secret = "e1c5bcb60a1b59327e9a64d0fb80bd10" // api secret
    let access_token_url = "http://fanfou.com/oauth/access_token"
    let verify_url = "http://api.fanfou.com/account/verify_credentials.xml"
    
    override init() {
        
        
    }
    
    func loginIdentifi(userName: String, passWord: String) {
        let parameters: Parameters = ["x_auth_username": userName,
                                      "x_auth_password": passWord,
                                      "x_auth_mode": "client_auth"]
        Alamofire.request(verify_url, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON { response in
            debugPrint(response)
            
            
        }
        
    }

}
