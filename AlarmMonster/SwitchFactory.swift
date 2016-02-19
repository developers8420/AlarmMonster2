//
//  SwitchFactory.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/08.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

import UIKit

class SwitchFactory: UISwitch {
    static func planeSwitch(
        rect:CGRect,
        on:Bool,
        delegate:AnyObject,
        action:Selector,
        tag:NSInteger) -> UISwitch {
        return makeSwitch(
            rect,
            on: on,
            delegate: delegate,
            action: action,
            tag: tag)
    }

    static func makeSwitch(
        rect:CGRect,
        on:Bool,
        delegate:AnyObject,
        action:Selector,
        tag:NSInteger) -> UISwitch {
        let sw:UISwitch = UISwitch(frame: rect)
        sw.on = on
        sw.addTarget(delegate, action: action, forControlEvents: UIControlEvents.ValueChanged)
        sw.tag = tag
        return sw
    }
}
