//
//  AlarmModel.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/15.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

import UIKit

class AlarmModel {
    private var alarmArray: [Dictionary<String, String>] = []
    private let ALARM_NOT_SET:String = "未設定"
    private let RUN_FLAG_OFF = "0"
    private let RUN_FLAG_ON = "1"
    private let REPEAT_FLAG_OFF = "0"
    private let REPEAT_FLAG_ON = "1"
    private let REPEAT_INDEX = 4
    
    // Alarm情報を設定
    func setAlarmArray(ary: [Dictionary<String, String>]) {
        if (ary.count > 0) {
            alarmArray = ary
        } else {
            alarmArray = [Dictionary<String, String>]()
        }
    }
    
    // Alarm情報配列を取得
    func getAlarmArray() -> [Dictionary<String, String>] {
        return alarmArray
    }
    
    // Alarm情報を取得
    func getAlarmDic(indexRow: Int) -> Dictionary<String, String> {
        if (alarmArray.count > 0) {
            return alarmArray[indexRow]
        } else {
            return Dictionary<String, String>()
        }
    }
    
    // IDを取得
    func getId(indexRow: Int) -> String {
        if (alarmArray.count > 0) {
            return alarmArray[indexRow]["ID"]!
        } else {
            return ""
        }
    }
    
    // ALARMを取得
    func getAlarm(indexRow: Int) -> String {
        if (alarmArray.count > 0) {
            return alarmArray[indexRow]["ALARM"]!
        } else {
            return ALARM_NOT_SET
        }
    }
    
    // RUN_FLAGを取得
    func getRunFlag(indexRow: Int) -> String {
        if (alarmArray.count > 0) {
            return alarmArray[indexRow]["RUN_FLAG"]!
        } else {
            return RUN_FLAG_OFF
        }
    }

    // REPEAT_FLAGを取得
    func getRepeatFlag(indexRow: Int) -> String {
        if (alarmArray.count > 0) {
            return alarmArray[indexRow]["REPEAT_FLAG"]!
        } else {
            return REPEAT_FLAG_OFF
        }
        
    }
    
    // 先頭のRUN_FLAGがONのAlarmを取得する
    func getFirstAlarm() -> String {
        for dic:Dictionary<String, String> in alarmArray {
            if (dic["RUN_FLAG"] == RUN_FLAG_ON) {
                return dic["ALARM"]!
            }
        }
        return ALARM_NOT_SET
    }
    
    func setAlarmNotificaiton() {
        let app:UIApplication = UIApplication.sharedApplication()
        let oldNotifications:[UILocalNotification] = app.scheduledLocalNotifications!
        // 新しい通知を予約する前に古い通知を削除。
        if (oldNotifications.count > 0) {
            app.cancelAllLocalNotifications()
        }
        // formatterを作成
        let converter:DateConvert = DateConvert()
        for alarmDic:Dictionary<String, String> in alarmArray {
            if (alarmDic["RUN_FLAG"] == "1") {
                for var index:Int = 0; index < REPEAT_INDEX; index++ {
                    let alarm:UILocalNotification = UILocalNotification()
                    // アラームを鳴らす日付
                    alarm.fireDate = converter.getNextSecondsDate(converter.getFormatDate(alarmDic["ALARM"]!), repeatIndex: index)
                    // 現在地のタイムゾーン設定
                    alarm.timeZone = NSTimeZone.defaultTimeZone()
                    // リピート回数
                    alarm.repeatInterval = NSCalendarUnit(rawValue: 0)
                    // 鳴らす音楽ファイル名称
                    alarm.soundName = "alarm.mp3"
                    // バックグラウンドに表示するメッセージ
                    alarm.alertBody = alarmDic["ALARM"]! + "になりました！起きましょう！"
                    // アラート情報
                    alarm.userInfo = alarmDic
                    app.scheduleLocalNotification(alarm)
                }
            }
        }
        
    }
}
