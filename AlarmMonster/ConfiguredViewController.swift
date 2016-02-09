//
//  ConfiguredViewController.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/08.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

import UIKit

// アラーム管理画面
class ConfiguredViewController: FoundationViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // ConfiguredTableViewを作成
        let myTable: ConfiguredTableView
        = ConfiguredTableView(frame: self.defaultRect, style: UITableViewStyle.Plain)
        // ConfiguredTableViewをConfiguredViewControllerに追加
        self.view.addSubview(myTable)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
