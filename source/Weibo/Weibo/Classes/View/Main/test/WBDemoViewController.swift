//
//  WBDemoViewController.swift
//  Weibo
//
//  Created by Liang Yuan on 7/7/17.
//  Copyright © 2017 Liang Yuan. All rights reserved.
//

import UIKit

class WBDemoViewController: WBBaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(navigationController?.childViewControllers.count ?? 0)"
    }
    func showNext(){
        let vc = WBDemoViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension WBDemoViewController{
    override func setupTableView() {
        navItem.rightBarButtonItem = UIBarButtonItem(title: "Next", target: self, action:  #selector(showNext))
    }
}
