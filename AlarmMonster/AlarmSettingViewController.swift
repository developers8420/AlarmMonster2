//
//  AlarmSettingViewController.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/08.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

import UIKit

class AlarmSettingViewController: FoundationViewController {
    
    // 初期化
    var datePicker:UIDatePicker?
    
    var helper:AlarmDBHelper = AlarmDBHelper()
    
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
        datePicker?.datePickerMode = UIDatePickerMode.Time
        // UIDatePickerの背景色の設定　デフォルトカラー
        datePicker?.backgroundColor
            = UIColor(colorLiteralRed:0.302, green:0.584, blue:0.949, alpha:0.5)
        // localeの設定 日本
        datePicker?.locale = NSLocale(localeIdentifier: "ja_JP")
        // AlarmSettingViewControllerへDatePickerの配置
        self.view.addSubview(datePicker!)
        
        // 決定ボタンの設定
        let resultRect:CGRect = CGRectMake(
            self.defaultX,
            self.defaultY + (datePicker?.frame.size.height)!,
            self.defaultWidth,
            60)
        let resultButton:UIButton = ButtonFactory.planeButton(resultRect, text: "決定", delegate: self, action: "result", tag: 200)
        resultButton.backgroundColor = UIColor(colorLiteralRed:0.302, green:0.584, blue:0.949, alpha:0.5)
        self.view.addSubview(resultButton)
    }
    
    // アラーム決定
    func result() {
        let formatter:NSDateFormatter = NSDateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP")
        formatter.dateFormat = "HH:mm"
        let result:String = formatter.stringFromDate((datePicker?.date)!)

        var alarmDic:Dictionary<String, String> = Dictionary<String, String>()
        alarmDic["ALARM"] = result
        alarmDic["RUN_FLAG"] = "1"
        alarmDic["REPEAT_FLAG"] = "1"
        let ret:Bool = helper.insert(alarmDic)
        
        if (ret) {
            // INSERT成功した場合
            let model:AlarmModel = AlarmModel()
            model.setAlarmArray(helper.selectAll())
            model.setAlarmNotificaiton()
            self.navigationController?.popViewControllerAnimated(true)
            
        } else {
            // INSERT失敗した場合
            let alertController:UIAlertController = UIAlertController(title: "確認", message: "既に登録されています。", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "はい", style: UIAlertActionStyle.Default) {action -> Void in
                print("Default")})
            
            self.presentViewController(alertController, animated: true, completion: nil)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
}