//
//  UIBarButtonItem+Extensions.swift
//  Weibo
//
//  Created by Liang Yuan on 7/7/17.
//  Copyright © 2017 Liang Yuan. All rights reserved.
//

import UIKit
extension UIBarButtonItem{
    /// UIBarButtonItem
    ///
    /// - Parameters:
    ///   - title: titel
    ///   - fontSize: font size
    ///   - target: target
    ///   - action: action
    ///   - isBack: isBack
    convenience init(title: String, fontSize:CGFloat = 16, target:AnyObject?, action: Selector, isBack: Bool = false){
        let btn: UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        if isBack{
            let imageName = "navigation"
            btn.setImage(UIImage(named: imageName), for: .normal)
            //btn.setImage(UIImage(named: imageName+"_highlighted"), for: .normal)
            btn.sizeToFit()
        }
        btn.addTarget(target, action: action, for: .touchUpInside)
        //instance UIBarButtonItem
        self.init(customView:btn)
    }
}
