//
//  NormalButton.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/08.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

import UIKit

class NormalButton: UIButton {
    func planeButton(text:NSString, delegate:AnyObject, action:Selector, tag:NSInteger) -> UIButton {
        // ボタン作成
        let button:UIButton = UIButton(type: UIButtonType.RoundedRect)
        button.setTitle(text as String, forState: UIControlState.Normal)
        button.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
        button.setTitleColor(UIColor.grayColor(), forState: UIControlState.Highlighted)
        
        // ボタンのフレームを指定
        button.sizeToFit()
        button.frame = frame
        
        // 枠線を設定
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.lightGrayColor().CGColor
        
        // 画面が変わってもボタンの位置を自動調整
        button.autoresizingMask =
            [UIViewAutoresizing.FlexibleWidth,
            UIViewAutoresizing.FlexibleHeight,
            UIViewAutoresizing.FlexibleLeftMargin,
            UIViewAutoresizing.FlexibleRightMargin,
            UIViewAutoresizing.FlexibleTopMargin,
            UIViewAutoresizing.FlexibleBottomMargin]
        // ボタンのタグを指定
        button.tag = tag
        // ボタンをタップした際に規定のメソッドを呼び出す
        button.addTarget(delegate, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        return button
    }
    
    // 画像ボタン作成
    func imageButton(img:UIImage, isHighlighte:Bool, on_img:UIImage, delegate:AnyObject, action:Selector, tag:NSInteger) -> UIButton {
        // ボタン作成
        let button:UIButton = UIButton(type: UIButtonType.Custom)
        // ボタンのフレームを指定
        button.frame = frame
        // ボタンの画像を指定
        button.setImage(img, forState: UIControlState.Normal)
        button.adjustsImageWhenDisabled = false
        if (!isHighlighte) {
            button.showsTouchWhenHighlighted = false
            button.adjustsImageWhenHighlighted = false
        } else if(!on_img.isEqual(NSNull)) {
            button.setImage(on_img, forState: UIControlState.Normal)
        }
        // ボタンのタグを指定
        button.tag = tag
        // ボタンをタップした際に規定のメソッドを呼び出す
        button.addTarget(delegate, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        return button
    }
    
}
