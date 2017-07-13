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
        loadAppInfo()
        return true
    }
}


// MARK: - 从服务器加载应用程序信息
extension AppDelegate{
    func loadAppInfo(){
        DispatchQueue.global().async {
            let url = Bundle.main.url(forResource: "main", withExtension: "json")
            let data = NSData (contentsOf: url!)
            let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
            let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
            data?.write(toFile: jsonPath, atomically: true)
            print(jsonPath)
        }
    }
}

