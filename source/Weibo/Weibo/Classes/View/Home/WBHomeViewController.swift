//
//  WBHomeViewController.swift
//  Weibo
//
//  Created by Liang Yuan on 12/5/17.
//  Copyright © 2017 Liang Yuan. All rights reserved.
//

import UIKit

private let cellId = "cellId"

class WBHomeViewController: WBBaseController {
    lazy var statusList = [String]()
    
    override func loadData() {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+1, execute: {
            for i in 0..<15{
                if self.isPullUp{
                    self.statusList.append("pull up \(i)")
                }
                self.statusList.insert(i.description, at: 0)
            }
            self.refreshControl?.endRefreshing()
            self.isPullUp = false
            //print("reload")
            self.tableView?.reloadData()
        })
    }
    
    func showFriends(){
        //print("xx")
        let vc = WBDemoViewController()
        //vc.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(vc, animated: true)
    }
}


// MARK: - table, data source method
extension WBHomeViewController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return statusList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //get cell
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        //set cell
        cell.textLabel?.text = statusList[indexPath.row]
        //return cell
        return cell
    }
}

// MARK: - setup interface
extension WBHomeViewController{
    override func setupTableView(){
        super.setupTableView()
        //set navi 
//        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "friends", style: .plain, target: self, action: #selector(showFriends))
//        let btn: UIButton = UIButton.cz_textButton("Friends", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
//        btn.addTarget(self, action: #selector(showFriends), for: .touchUpInside)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
        navItem.leftBarButtonItem = UIBarButtonItem(title: "Friends", target: self, action: #selector(showFriends))
        //注册原型cell
        tableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
}
