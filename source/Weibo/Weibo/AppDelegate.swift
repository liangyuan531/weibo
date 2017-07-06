//
//  AppDelegate.swift
//  Weibo
//
//  Created by Liang Yuan on 11/5/17.
//  Copyright © 2017 Liang Yuan. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
        window = UIWindow()
        window?.backgroundColor = UIColor.white
        
        window?.rootViewController = WBMainViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
}

