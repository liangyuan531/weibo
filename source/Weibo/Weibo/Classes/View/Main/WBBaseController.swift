//
//  WBBaseController.swift
//  Weibo
//
//  Created by Liang Yuan on 12/5/17.
//  Copyright © 2017 Liang Yuan. All rights reserved.
//

import UIKit

class WBBaseController: UIViewController {
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0,y:0, width: UIScreen.cz_screenWidth(), height: 64))
    lazy var navItem = UINavigationItem()
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}

extension WBBaseController{
    func setupUI(){
        view.backgroundColor = UIColor.cz_random()
        view.addSubview(navigationBar)
        navigationBar.items = [navItem]
    }
}
