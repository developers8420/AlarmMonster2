//
//  ConfiguredTableView.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/08.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

import UIKit

class ConfiguredTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    var model:UserDefaultModel?
    
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
        model = UserDefaultModel()
        
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
            return 1
    }

    //
    func tableView(
        tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
            let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "Cell")
            return cell
    }
    
}
