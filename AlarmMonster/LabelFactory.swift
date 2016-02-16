//
//  LabelFactory.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/08.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

import UIKit

class LabelFactory: UILabel {
    func planeLabel(rect:CGRect,
                    text:NSString,
                    font:UIFont,
                    textColor:UIColor,
                    textAlignment:NSTextAlignment,
                    backgroundColor:UIColor,
                    cornerRadius:CGFloat) -> UILabel {
        let label:UILabel = self.makeLabel(
            rect,
            text: text,
            font: font,
            textColor: textColor,
            textAlignment: textAlignment,
            backgroundColor: backgroundColor)
        return label
    }
    
    func roundRectLabel(rect:CGRect,
                        text:NSString,
                        font:UIFont,
                        textColor:UIColor,
                        textAlignment:NSTextAlignment,
                        backgroundColor:UIColor,
                        cornerRadius:CGFloat) -> UILabel {
        let label:UILabel = self.makeLabel(
            rect,
            text: text,
            font: font,
            textColor: textColor,
            textAlignment: textAlignment,
            backgroundColor: backgroundColor)
        label.layer.cornerRadius = cornerRadius
        label.clipsToBounds = true
        return label
    }
    
    func makeLabel(rect:CGRect,
                   text:NSString,
                   font:UIFont,
                   textColor:UIColor,
                   textAlignment:NSTextAlignment,
                   backgroundColor:UIColor) -> UILabel {
        let label:UILabel = UILabel(frame: rect)
        label.text = text as String
        label.font = font
        label.textColor = textColor
        label.textAlignment = textAlignment
        label.numberOfLines = 0
        label.backgroundColor = backgroundColor
        return label
    }
    
}
