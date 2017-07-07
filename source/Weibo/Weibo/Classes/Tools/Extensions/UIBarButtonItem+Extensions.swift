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
    convenience init(title: String, fontSize:CGFloat = 16, target:AnyObject?, action: Selector){
        let btn: UIButton = UIButton.cz_textButton(title, fontSize: fontSize, normalColor: UIColor.darkGray, highlightedColor: UIColor.orange)
        btn.addTarget(target, action: action, for: .touchUpInside)
        //instance UIBarButtonItem
        self.init(customView:btn)
    }
}
