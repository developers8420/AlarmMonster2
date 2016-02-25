//
//  AlarmModel.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/15.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

class AlarmModel {
    private var alarmArray: [Dictionary<String, String>]?
    private let ALARM_NOT_SET:String = "未設定"
    private let RUN_FLAG_OFF = "0"
    private let RUN_FLAG_ON = "1"
    private let REPEAT_FLAG_OFF = "0"
    private let REPEAT_FLAG_ON = "1"
    
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
        return alarmArray!
    }
    
    // Alarm情報を取得
    func getAlarmDic(indexRow: Int) -> Dictionary<String, String> {
        if (alarmArray!.count > 0) {
            return alarmArray![indexRow] 
        } else {
            return Dictionary<String, String>()
        }
    }
    
    // IDを取得
    func getId(indexRow: Int) -> String {
        if (alarmArray!.count > 0) {
            return alarmArray![indexRow]["ID"]!
        } else {
            return ""
        }
    }
    
    // ALARMを取得
    func getAlarm(indexRow: Int) -> String {
        if (alarmArray!.count > 0) {
            return alarmArray![indexRow]["ALARM"]!
        } else {
            return ALARM_NOT_SET
        }
    }
    
    // RUN_FLAGを取得
    func getRunFlag(indexRow: Int) -> String {
        if (alarmArray!.count > 0) {
            return alarmArray![indexRow]["RUN_FLAG"]!
        } else {
            return RUN_FLAG_OFF
        }
    }

    // REPEAT_FLAGを取得
    func getRepeatFlag(indexRow: Int) -> String {
        if (alarmArray!.count > 0) {
            return alarmArray![indexRow]["REPEAT_FLAG"]!
        } else {
            return REPEAT_FLAG_OFF
        }
        
    }
    
    // 先頭のRUN_FLAGがONのAlarmを取得する
    func getFirstAlarm() -> String {
        for dic:Dictionary<String, String> in alarmArray! {
            if (dic["RUN_FLAG"] == RUN_FLAG_ON) {
                return dic["ALARM"]!
            }
        }
        return ALARM_NOT_SET
    }
}
