//
//  WBMainViewController.swift
//  Weibo
//
//  Created by Liang Yuan on 12/5/17.
//  Copyright © 2017 Liang Yuan. All rights reserved.
//

import UIKit

class WBMainViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildControllers()
        setupComposeButton()
    }
    
    func composeListener(){
        print("compose")
    }
    //compose button
    lazy var composeButton: UIButton = UIButton.cz_imageButton("tabbar_compose_icon_add", backgroundImageName: "tabbar_compose_button")
    
}
//类似于OC 的分类， 可以用来切分代码块
//可以把相近功能的函数放在一个extention中
//note: 不能定义属性
// MARK: - set interface
extension WBMainViewController{
    func setupComposeButton(){
        tabBar.addSubview(composeButton)
        let count = CGFloat(childViewControllers.count)
        let w = tabBar.bounds.width / count - 1
        composeButton.frame = tabBar.bounds.insetBy(dx: 2*w, dy: 0)
        composeButton.addTarget(self, action: #selector(composeListener), for: .touchUpInside)
    }
    func setupChildControllers(){
        let array = [
            ["clsName":"WBHomeViewController", "title":"Home", "imageName":"home",
             "visitorInfo":["imageName":"","message":"关注一些人，回这里看看有什么惊喜"]
            ],
            ["clsName":"WBMessageViewController", "title":"Message", "imageName":"message_center",
             "visitorInfo":["imageName":"visitordiscover_image_message","message":"登录后，别人评论你的微博，发给你的消息，都会在这里收到通知"]
            ],
            ["clsName":"UIViewController"],
            ["clsName":"WBDiscoverViewController", "title":"Discover", "imageName":"discover",
             "visitorInfo":["imageName":"visitordiscover_image_message","message":"登录后，最新、最热微博尽在掌握，不再会与事实潮流擦肩而过"]
            ],
            ["clsName":"WBProfileViewController", "title":"Profile", "imageName":"profile",
             "visitorInfo":["imageName":"visitordiscover_image_profile","message":"登录后，你的微博、相册、个人资料会显示在这里，展示给别人"]
            ]
        ]
        var arrayM = [UIViewController]()
        for dict in array {
            arrayM.append(controller(dict: dict))
        }
        viewControllers = arrayM
    }
    
    //使用字典创建一个子控制器
    private func controller(dict : [String : Any]) -> UIViewController{
        guard let clsName = dict["clsName"] as? String,
            let title = dict["title"] as? String,
            let imageName = dict["imageName"] as? String,
            let cls = NSClassFromString(Bundle.main.namespace + "." + clsName) as? WBBaseController.Type,
            let visitorDict = dict["visitorInfo"] as? [String: String]
            else{
                return UIViewController()
            }
        //print(cls)
        let vc = cls.init()
        vc.title = title
        //set visitor info dict
        vc.visitorInfoDict = visitorDict
        //set image
        vc.tabBarItem.image = UIImage(named: "tabbar_"+imageName)
        vc.tabBarItem.selectedImage = UIImage(named: "tabbar_"+imageName+"_highlighted")?.withRenderingMode(.alwaysOriginal)
        //set tab bar text
        vc.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName:UIColor.orange], for: .highlighted)
        vc.tabBarItem.setTitleTextAttributes([NSFontAttributeName:UIFont.systemFont(ofSize: 12)], for: .normal)
        //WBNavigationController(rootViewController: vc)
        let nav = WBNavigationController.init(rootViewController: vc)
        return nav
    }
}
