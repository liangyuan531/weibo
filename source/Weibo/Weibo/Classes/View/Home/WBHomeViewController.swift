//
//  WBHomeViewController.swift
//  Weibo
//
//  Created by Liang Yuan on 12/5/17.
//  Copyright © 2017 Liang Yuan. All rights reserved.
//

import UIKit

class WBHomeViewController: WBBaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showFriends(){
        print("xx")
        let vc = WBDemoViewController()
        vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}

// MARK: - setup interface
extension WBHomeViewController{
    override func setupUI() {
        super.setupUI()
        //set navi 
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "friends", style: .plain, target: self, action: #selector(showFriends))
    }
}
