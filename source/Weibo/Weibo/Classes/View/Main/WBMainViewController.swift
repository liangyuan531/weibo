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
        //获取沙盒路径
        let docDir = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        let jsonPath = (docDir as NSString).appendingPathComponent("main.json")
        //加载data
        var data = NSData(contentsOfFile: jsonPath)
        //判断data是否有内容，如果没有，说明本地沙盒没有文件
        if data == nil {
            //加载本地
            let path = Bundle.main.path(forResource: "main.json", ofType: nil)
            data = NSData(contentsOfFile: path!)
        }
        guard let array = try? JSONSerialization.jsonObject(with: data! as Data, options: []) as? [[String: AnyObject]]
            else{
            return
        }
        var arrayM = [UIViewController]()
        for dict in array! {
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
