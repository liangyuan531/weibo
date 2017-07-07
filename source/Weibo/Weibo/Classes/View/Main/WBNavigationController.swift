//
//  WBNavigationController.swift
//  Weibo
//
//  Created by Liang Yuan on 12/5/17.
//  Copyright © 2017 Liang Yuan. All rights reserved.
//

import UIKit

class WBNavigationController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //hide default navi bar
        navigationBar.isHidden = true
    }
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if childViewControllers.count > 0{
            viewController.hidesBottomBarWhenPushed = true
            //judge the type of controller
            if let vc = viewController as? WBBaseController{
                var title = "Back"
                if childViewControllers.count == 1 {
                    title = childViewControllers.first?.title ?? "Back"
                }
                vc.navItem.leftBarButtonItem = UIBarButtonItem(title: title, target: self, action: #selector(back))
            }
        }
                super.pushViewController(viewController, animated: true)
    }
    
    func back(){
        popViewController(animated: true)
    }
}
