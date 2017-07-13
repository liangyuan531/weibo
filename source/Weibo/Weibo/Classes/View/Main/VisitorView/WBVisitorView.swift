//
//  WBVisitorView.swift
//  Weibo
//
//  Created by Liang Yuan on 13/7/17.
//  Copyright © 2017 Liang Yuan. All rights reserved.
//

import UIKit

class WBVisitorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


// MARK: - setup UI
extension WBVisitorView{
    func setupUI(){
        backgroundColor = UIColor.white
        
    }
}
