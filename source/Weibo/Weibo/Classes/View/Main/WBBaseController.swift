//
//  WBBaseController.swift
//  Weibo
//
//  Created by Liang Yuan on 12/5/17.
//  Copyright © 2017 Liang Yuan. All rights reserved.
//

import UIKit

class WBBaseController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }
}

extension WBBaseController{
    func setupUI(){
        view.backgroundColor = UIColor.cz_random()
    }
}
