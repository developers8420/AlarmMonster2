//
//  ConfiguredTableView.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/08.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

import UIKit

class ConfiguredTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    // AlarmModel
    private var model:AlarmModel?
    // AlarmDBHelper
    private var helper:AlarmDBHelper?
    // HIDDEN_COLOR
    private let HIDDEN_COLOR = UIColor(colorLiteralRed: 0.808, green: 0.859, blue: 0.851, alpha: 0.5)
    
    // イニシャライザ
    override init(frame: CGRect, style: UITableViewStyle) {
        // スーパークラスのイニシャライザ呼び出し
        super.init(frame: frame, style: style)
        // dataSourceに自クラスのオブジェクトを設定
        self.dataSource = self
        // delegateに自クラスのオブジェクトを設定
        self.delegate = self
        // TableViewの区切り線を設定：１本線
        self.separatorStyle = UITableViewCellSeparatorStyle.SingleLine
        // セパレーターの中へ初期設定なし
        self.separatorInset = UIEdgeInsetsZero
        
        // UserDefaultの初期化
        
        // Selectorは文字列指定
        if (self.respondsToSelector("layoutMargins:")) {
            // UITableViewの境界線を端まで描画
            self.layoutMargins = UIEdgeInsetsZero
        }
    }

    // required:イニシャライザのオーバーライドを強制する
    required init(coder aDecoder: NSCoder) {
        // 自動生成されたコード
        fatalError("init(coder:) has not been implemented")
    }

    //
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    //
    func tableView(
        tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            //model.getAlarmSettingAry.count
            return (model?.getAlarmArray().count)!
    }

    //
    func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            var cell: UITableViewCell? = UITableViewCell(
                style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
            if (cell == nil) {
                cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "Cell")
            }
        
            for subview:UIView in (cell?.contentView.subviews)! {
                subview.removeFromSuperview()
            }
            let cellRect:CGRect = CGRectMake(0, 0, self.frame.size.width, 40)
            let cellView:UIView = UIView(frame: cellRect)
            
            let alarm:String = model!.getAlarm(indexPath.row)
            let alarmRect:CGRect = CGRectMake(5, 5, 100, 30)
            let alarmLabel:UILabel = LabelFactory.planeLabel(
                alarmRect,
                text: alarm,
                font: UIFont.boldSystemFontOfSize(20),
                textColor: UIColor.lightGrayColor(),
                textAlignment: NSTextAlignment.Center,
                backgroundColor: UIColor.clearColor())
            var flag:Bool
            if (model?.getRunFlag(indexPath.row) == "1") {
                flag = true
            } else {
                flag = false
            }
            
            let flagRect:CGRect = CGRectMake(self.frame.size.width - 55, 5, 40, 30)
            let flagSwitch:UISwitch = SwitchFactory.planeSwitch(
                flagRect, on: flag, delegate: self, action: "", tag: indexPath.row)
            cellView.addSubview(alarmLabel)
            cellView.addSubview(flagSwitch)
            cell?.contentView.addSubview(cellView)
            
            return cell!
    }
    
    //
    func tableview(tableView:UITableView,
        commitEditingStyle editingStyle:UITableViewCellEditingStyle,
        forRowAtIndexPath indexPath:NSIndexPath) {
    }
    
    //
    func tableView(tableView:UITableView,
        editActionForRowAtIndexPath indexPath:NSIndexPath) -> [UITableViewRowAction] {
            return [UITableViewRowAction(
                style: UITableViewRowActionStyle.Destructive,
                title: "削除",
                handler: {(action:UITableViewRowAction, indexPath:NSIndexPath) in
                    self.helper!.delete((self.model?.getAlarmDic(indexPath.row))!)
                    self.reloadModelView()
            })]
    }
    
    //
    func changeRunFlag(sw:UISwitch) {
        var flag:String
        if (sw.on) {
            flag = "1"
        } else {
            flag = "0"
        }
        var takeDic:Dictionary<String, String> = (model?.getAlarmDic(sw.tag))!
        takeDic["RUN_FLAG"] = flag
        
        helper?.update(takeDic)
        self.reloadModelView()
    }
    
    // 
    func reloadModelView () {
        model?.setAlarmArray((helper?.selectAll())!)
        self.reloadData()
    }
    
}
