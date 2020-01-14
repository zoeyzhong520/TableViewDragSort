//
//  AppDelegate.swift
//  UITableView拖拽排序
//
//  Created by 仲召俊 on 2020/1/14.
//  Copyright © 2020 zhongzj. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.rootViewController = UINavigationController(rootViewController: ViewController())
        return true
    }


}

