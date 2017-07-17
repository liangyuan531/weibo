//
//  WBBaseController.swift
//  Weibo
//
//  Created by Liang Yuan on 12/5/17.
//  Copyright © 2017 Liang Yuan. All rights reserved.
//

import UIKit
//swift 有多继承， OC 没有，使用协议代替
//class WBBaseController: UIViewController , UITableViewDataSource, UITableViewDelegate

class WBBaseController: UIViewController{
    var tableView: UITableView?
    var refreshControl: UIRefreshControl?
    var isPullUp = false
    var userLogon = false
    var visitorInfoDict: [String: String]?
    
    lazy var navigationBar = UINavigationBar(frame: CGRect(x: 0,y:0, width: UIScreen.cz_screenWidth(), height: 64))
    lazy var navItem = UINavigationItem()
    //override title of naviation bar
    override var title: String?{
        didSet{
            navItem.title = title
        }
    }
    
    func loadData(){
        refreshControl?.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        loadData()
    }
}

extension WBBaseController{
    func login(){
        print("login")
    }
    func register(){
        print("register")
    }
}

// MARK: - setup interface
extension WBBaseController{
    func setupUI(){
        view.backgroundColor = UIColor.white
        //取消自动缩进
        automaticallyAdjustsScrollViewInsets = false
        setupNavigationBar()
        userLogon ? setupTableView() : setupVisitorView()
    }
    
    //设置访客视图
    private func setupVisitorView(){
        let visitorView = WBVisitorView(frame: view.bounds)
        view.insertSubview(visitorView, belowSubview: navigationBar)
        //设置访客视图信息
        visitorView.visitorInfo = visitorInfoDict
        visitorView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
        visitorView.registerButton.addTarget(self, action: #selector(register), for: .touchUpInside)
        //设置导航按钮
        navItem.leftBarButtonItem = UIBarButtonItem(title: "register", style: .plain, target: self, action: #selector(register))
        navItem.rightBarButtonItem = UIBarButtonItem(title: "login", style: .plain, target: self, action: #selector(login))
    }
    
    //子类重写此方法，因为子类不需要关心用户登录之前的逻辑
    func setupTableView(){
        tableView = UITableView(frame: view.bounds, style: .plain)
        view.insertSubview(tableView!, belowSubview: navigationBar)
        //set data source and delegate, in oder to let sub-class implement
        tableView?.dataSource = self
        tableView?.delegate = self
        
        tableView?.contentInset = UIEdgeInsets(top: navigationBar.bounds.height, left: 0, bottom: tabBarController?.tabBar.bounds.height ?? 49, right: 0)
        
        //set refresh
        //initialize
        refreshControl = UIRefreshControl()
        //add to tableview
        tableView?.addSubview(refreshControl!)
        //add listener
        refreshControl?.addTarget(self, action: #selector(loadData), for: .valueChanged)
    }
    
    private func setupNavigationBar(){
        view.addSubview(navigationBar)
        //set item to bar
        navigationBar.items = [navItem]
        //设置导航条背景颜色
        navigationBar.barTintColor = UIColor.cz_color(withHex: 0xF6F6F6)
        //设置title颜色
        navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.darkGray]
        //设置系统按钮的文字颜色
        navigationBar.tintColor = UIColor.orange
    }
}

extension WBBaseController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    //基类只是准备方法，子类负责具体的实现
    //子类的数据源方法不需要supper
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    //上拉刷新
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //判断indexpath是不是最后一行
        let row = indexPath.row
        let section = tableView.numberOfSections - 1
        if row < 0 || section < 0 {
            return
        }
        let count = tableView.numberOfRows(inSection: section)
        if row == (count - 1) || !isPullUp{
            //print("pull up refresh")
            isPullUp = true
            loadData()
        }
    }
}
