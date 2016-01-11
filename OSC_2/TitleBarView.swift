//
//  TitleBarView.swift
//  OSC_2
//
//  Created by 付小宁 on 16/1/11.
//  Copyright © 2016年 Maizi. All rights reserved.
//

import UIKit

class TitleBarView: UIScrollView {

    var titleButtonClicked: ((index: Int) -> (Void))?
    
    init() {
        
        super.init(frame: CGRectZero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 自定义初始化
    func initWithFrame(frame: CGRect, titles: [String]) -> TitleBarView {
        
        self.frame = frame
        
        let buttonWidth = frame.width/CGFloat(titles.count)
        let buttonHeight = frame.height
        
        for (idx, title) in titles.enumerate() {
            
            let button: UIButton = UIButton(type: UIButtonType.Custom)
            //            button.backgroundColor = UIColor(colorLiteralRed: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            button.titleLabel?.font = UIFont.boldSystemFontOfSize(15)

            
            button.setTitle(title, forState: UIControlState.Normal)
            button.frame = CGRectMake(buttonWidth * CGFloat(idx), 0, buttonWidth, buttonHeight)
            button.tag = idx
            
            button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            self.addSubview(button)
        }
        
        contentSize = CGSizeMake(CGRectGetWidth(frame), frame.size.height)
        return self
        
    }
    
    func buttonClicked(btn: UIButton) {
        titleButtonClicked!(index: btn.tag)
    }
}

