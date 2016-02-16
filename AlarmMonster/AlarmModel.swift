//
//  AlarmModel.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/15.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

class AlarmModel: NSObject {
    private var alarmArray: [Dictionary<String, String>]?
    
    func setAlarmArray(ary: [Dictionary<String, String>]) {
        if (ary.count > 0) {
            alarmArray = ary
        } else {
            alarmArray = [Dictionary<String, String>]()
        }
    }
    
    func getAlarmArray() -> [Dictionary<String, String>] {
        return alarmArray!
    }
    
    func getAlarmDic(indexRow: Int) -> Dictionary<String, String> {
        if (alarmArray!.count > 0) {
            return alarmArray![indexRow] 
        } else {
            return Dictionary<String, String>()
        }
    }
    
    func getId(indexRow: Int) -> String {
        if (alarmArray!.count > 0) {
            return alarmArray![indexRow]["ID"]!
        } else {
            return ""
        }
    }
    
    func getAlarm(indexRow: Int) -> String {
        if (alarmArray!.count > 0) {
            return alarmArray![indexRow]["ALARM"]!
        } else {
            return ""
        }
    }
    
    func getRunFlag(indexRow: Int) -> String {
        if (alarmArray!.count > 0) {
            return alarmArray![indexRow]["RUN_FLAG"]!
        } else {
            return ""
        }
    }
    
    func getRepeatFlag(indexRow: Int) -> String {
        if (alarmArray!.count > 0) {
            return alarmArray![indexRow]["REPEAT_FLAG"]!
        } else {
            return ""
        }
        
    }
    
    func getFirstAlarm() -> String {
        for dic:Dictionary<String, String> in alarmArray! {
            for key:String in dic.keys {
                if (dic[key] == "1") {
                    return dic[key]!
                }
            }
        }
        return ""
    }
}
