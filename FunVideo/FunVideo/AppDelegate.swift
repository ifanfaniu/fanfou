//
//  AppDelegate.swift
//  FunVideo
//
//  Created by yang wenjie on 2019/9/11.
//  Copyright © 2019 yang wenjie. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        let rootNavigationVC = UINavigationController(rootViewController: ViewController())
        self.window?.rootViewController = rootNavigationVC
        self.window?.makeKeyAndVisible()
        return true
    }
}

