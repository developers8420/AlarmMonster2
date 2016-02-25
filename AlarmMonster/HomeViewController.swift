//
//  HomeViewController.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/08.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

import UIKit

class HomeViewController: FoundationViewController {
    private var alarmDispBtn:UIButton?
    private var helper:AlarmDBHelper
    private var model: AlarmModel
    
    private let ALARM_IMAGE:String = "めざまし時計アイコン.png"
    private let MONSTER_IMG:String = "設定アイコン.png"
    private let WATAAME_IMG:String = "わたあめ1.png"
    
    private let BACK_COLOR:UIColor = UIColor(colorLiteralRed:0.894, green:0.894, blue:0.894, alpha:1.0)
    private let DEFAULT_COLOR:UIColor = UIColor(colorLiteralRed:0.302, green:0.584, blue:0.949, alpha:0.5)
    
    override required init(coder aDecoder: NSCoder) {
        helper = AlarmDBHelper()
        model = AlarmModel()
        super.init(coder: aDecoder)!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.setAlarmArray((helper.selectAll()))
        self.view.backgroundColor = BACK_COLOR

        // イメージを乗せるビュー
        let viewRect:CGRect = CGRectMake(
            self.defaultX,
            self.defaultY,
            self.defaultWidth,
            self.defaultHeight - 70)
        let backView:UIView = UIView(frame: viewRect)
        backView.backgroundColor = DEFAULT_COLOR
        self.view.addSubview(backView)
        
        // モンスターイメージ
        let monsterImageRect:CGRect = CGRectMake(
            viewRect.size.width / 3,
            viewRect.size.height / 3,
            viewRect.size.width / 3,
            viewRect.size.height / 3)
        let monsterImage:UIImage = UIImage(named: WATAAME_IMG)!
        let imageView:UIImageView = UIImageView(frame: monsterImageRect)
        imageView.image = monsterImage
        backView.addSubview(imageView)
        
        // 時間表示
        let alarmLabelRect:CGRect = CGRectMake(
            self.defaultX,
            self.defaultY + viewRect.size.height + 10,
            self.defaultWidth,
            60)
        let alarmDisp:UIButton = ButtonFactory.planeButton(
            alarmLabelRect,
            text:(model.getFirstAlarm()),
            delegate:self,
            action:"moveConfigured:",
            tag:3)
        alarmDisp.backgroundColor = DEFAULT_COLOR
        self.view.addSubview(alarmDisp)
        
        // イメージサイズ
        let imageRect:CGRect = CGRectMake(0, 0, 30, 30)
        
        // イメージの設定
        let alarmSettingImage:UIImage = UIImage(named: ALARM_IMAGE)!
        let monsterSettingImage:UIImage = UIImage(named: MONSTER_IMG)!
        
        // ボタンの作成
        let alarmButton:UIButton = ButtonFactory.imageButton(
            imageRect,
            img: alarmSettingImage,
            isHighlighte: true,
            on_img: alarmSettingImage,
            delegate: self,
            action: "moveAlarmSetting:",
            tag: 1)
        let monsterButton:UIButton = ButtonFactory.imageButton(
            imageRect,
            img: monsterSettingImage,
            isHighlighte: true,
            on_img: monsterSettingImage,
            delegate: self,
            action: "moveAlarmSetting:",
            tag: 2)
        // バーボタンの作成
        let alarmBarButton:UIBarButtonItem = UIBarButtonItem()
        
        // バーボタンの設定
        self.navigationItem.rightBarButtonItem = alarmBarButton
        
    }
    override func viewWillAppear(animated: Bool) {
        model.setAlarmArray(helper.selectRunAlarms())
        alarmDispBtn?.setTitle(model.getFirstAlarm(), forState: UIControlState.Normal)
    }
    
    // アラーム設定画面へ遷移
    func moveAlarmSetting() {
        print("アラーム設定画面へ移動！")
        self.performSegueWithIdentifier("AlarmSettingSegue", sender: self)
    }
    
    // モンスター設定画面へ移動
    func moveMonsterSetting() {
        print("モンスター設定画面へ移動！")
        self.performSegueWithIdentifier("MonsterSettingSegue", sender: self)
    }
    
    // 設定済みのアラーム画面に遷移
    func moveConfigured() {
        self.performSegueWithIdentifier("ConfiguredSegue", sender: self)
    }
    
    // 遷移先にパラメータを渡す場合
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "AlarmSettingSegue") {
            
        } else if (segue.identifier == "MonsterSettingSegue") {
            
        } else if (segue.identifier == "ConfiguredSegue") {
            
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
