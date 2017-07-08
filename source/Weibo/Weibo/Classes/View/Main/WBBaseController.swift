//
//  WBBaseController.swift
//  Weibo
//
//  Created by Liang Yuan on 12/5/17.
//  Copyright © 2017 Liang Yuan. All rights reserved.
//

import UIKit

class WBBaseController: UIViewController {
    var tableView: UITableView?
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0,y:0, width: UIScreen.cz_screenWidth(), height: 64))
    lazy var navItem = UINavigationItem()
    //override title of naviation bar
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

// MARK: - setup interface
extension WBBaseController{
    func setupUI(){
        view.backgroundColor = UIColor.cz_random()
        setupNavigationBar()
        setupTableView()
    }
    
    private func setupTableView(){
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navigationBar)
    }
    
    private func setupNavigationBar(){
        view.addSubview(navigationBar)
        //set item to bar
        navigationBar.items = [navItem]
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
    }
}
