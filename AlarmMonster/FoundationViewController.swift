//
//  FoundationViewController.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/08.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

import UIKit

class FoundationViewController : UIViewController {
    
    // 定数 mergin
    let MARGIN:CGFloat = 10

    // 画面サイズ（ステータスバー込み）
    var screenSize: CGSize!
    // ステータスバー
    var statusHeight: CGFloat!
    // ナビゲーションバー
    var navigationBarHeight: CGFloat!
    // 下地のビューx開始地点
    var defaultX: CGFloat!
    // 下地のビューy開始地点
    var defaultY: CGFloat!
    // 下地のビュー横幅
    var defaultWidth: CGFloat!
    // 下地のビュー縦幅
    var defaultHeight: CGFloat!
    // 下地の配置
    var defaultRect: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 画面サイズ（ステータスバー込み）
        screenSize = UIScreen.mainScreen().bounds.size
        // ステータスバーの高さ取得
        statusHeight = UIApplication.sharedApplication().statusBarFrame.size.height
        // ナビゲーションバーの高さ取得
        navigationBarHeight = navigationController!.navigationBar.frame.size.height
        
        // 下地のビューx開始地点取得
        defaultX = MARGIN
        // 下地のビューy開始地点取得
        defaultY = statusHeight + navigationBarHeight + MARGIN
        // 下地のビュー横幅取得
        defaultWidth = screenSize.width - (MARGIN * 2)
        // 下地のビュー縦幅取得
        defaultHeight = screenSize.height - defaultY - MARGIN
        // 下地の配置取得
        defaultRect = CGRectMake(
            defaultX,
            defaultY,
            defaultWidth,
            defaultHeight)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
