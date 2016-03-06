//
//  DateConvert.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/03/01.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

import Foundation

class DateConvert {
    private let ALARM_FORMAT_STR = "HH:mm"
    private let NOWDATE_FORMAT_STR = "yyyy/mm/dd"
    private let INTERIM_FORMAT_STR = "yyyy/mm/dd HH:mm:ss"
    private let LOCALE = "ja_JP"
    
    private var alarmFormat:NSDateFormatter
    private var nowDateFormat:NSDateFormatter
    private var interimFormat:NSDateFormatter
    
    // 初期化時にFormatの設定をする
    required init() {
        alarmFormat = NSDateFormatter()
        nowDateFormat = NSDateFormatter()
        interimFormat = NSDateFormatter()
        
        alarmFormat.locale = NSLocale(localeIdentifier: LOCALE)
        nowDateFormat.locale = NSLocale(localeIdentifier: LOCALE)
        interimFormat.locale = NSLocale(localeIdentifier: LOCALE)
        
        alarmFormat.dateFormat = ALARM_FORMAT_STR
        nowDateFormat.dateFormat = NOWDATE_FORMAT_STR
        interimFormat.dateFormat = INTERIM_FORMAT_STR
    }
    
    
    // 成形された日付データを取得
    func getFormatDate(alarmDateStr:String) -> NSDate {
        if (alarmDateStr.characters.count < 5) {
            return NSDate()
        }
        
        // 現在の日付を文字に変換
        let nowDateStr:String = nowDateFormat.stringFromDate(NSDate())
        
        // 今日の日付に渡されてきた日付をくっつける
        let interimDateStr:String = nowDateStr + " " + alarmDateStr + ":00"
        
        // 暫定的な日付として保持
        let interimDate:NSDate = interimFormat.dateFromString(interimDateStr)!
        
        // 渡されてきた時間が今の時間より前なら次の日として設定する
        if (istTodayTime(interimDate)) {
            return interimDate
        } else {
            return getNextDate(interimDate)
        }
    }
    
    // 今日の時間か
    func istTodayTime(orgDate:NSDate) -> Bool {
        let result:NSComparisonResult = NSDate().compare(orgDate)
        
        switch(result) {
            // 同一時刻
            case .OrderedSame:
                return true
            // 未来
            case .OrderedAscending:
                return true
            // 過去
            case .OrderedDescending:
                return false
        }
    }
    
    // 次の日付を取得
    func getNextDate(interimDate:NSDate) -> NSDate {
        // 1日後
        return NSDate(timeInterval: 1 * 24 * 60 * 60, sinceDate: interimDate)
    }
    
    // 今日の日付か
    func isNowDate(compareDate:NSDate) -> Bool {
        let nowDateStr:String = nowDateFormat.stringFromDate(NSDate())
        let compareDateStr:String = nowDateFormat.stringFromDate(compareDate)
        
        if (nowDateStr == compareDateStr) {
            return true
        } else {
            return false
        }
    }
    
    // 次の秒数を取得
    func getNextSecondsDate(orgDate:NSDate, repeatIndex:Int) -> NSDate {
        let nextSecondsDate:NSDate = NSDate(timeInterval: Double(repeatIndex) * Double(15), sinceDate: orgDate)
        print(interimFormat.stringFromDate(nextSecondsDate))
        return nextSecondsDate
    }
}