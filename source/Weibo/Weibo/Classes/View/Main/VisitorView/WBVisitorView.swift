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
    
    
    // MARK: - 私有控件
    private lazy var iconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
    private lazy var houseIconView: UIImageView = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
    private lazy var tipLabel: UILabel = UILabel.cz_label(withText: "关注一些人，回这里看看有什么惊喜关注一些人，回这里看看有什么惊喜", fontSize: 14, color: UIColor.darkGray)
    private lazy var registerButton: UIButton = UIButton.cz_textButton("sign in", fontSize: 16, normalColor: UIColor.orange, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    private lazy var LoginButton: UIButton = UIButton.cz_textButton("login", fontSize: 16, normalColor: UIColor.darkGray, highlightedColor: UIColor.black, backgroundImageName: "common_button_white_disable")
    
}


// MARK: - setup UI
extension WBVisitorView{
    func setupUI(){
        backgroundColor = UIColor.white
        
    }
}
