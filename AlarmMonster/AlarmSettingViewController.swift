//
//  AlarmSettingViewController.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/08.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

import UIKit

class AlarmSettingViewController: FoundationViewController {
    
    var datePicker:UIDatePicker
    
    // 初期表示処理
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 背景色の設定
        self.view.backgroundColor
            = UIColor(colorLiteralRed: 0.894, green: 0.894, blue: 0.894, alpha: 1.0)
        // datePickerの設定
        // 画面に配置する位置を設定
        let pickerRect: CGRect = CGRectMake(
            self.defaultX,
            self.defaultY,
            self.defaultWidth,
            self.defaultHeight - 70)
        datePicker = UIDatePicker(frame: pickerRect)
        // UIDatePickerModeの設定　時間のみ
        datePicker.datePickerMode = UIDatePickerMode.Time
        // UIDatePickerの背景色の設定　デフォルトカラー
        datePicker.backgroundColor
            = UIColor(colorLiteralRed:0.302, green:0.584, blue:0.949, alpha:0.5)
        // localeの設定 日本
        datePicker.locale = NSLocale(localeIdentifier: "ja_JP")
        // AlarmSettingViewControllerへDatePickerの配置
        self.view.addSubview(datePicker)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}