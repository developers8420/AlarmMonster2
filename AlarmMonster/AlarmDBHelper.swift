//
//  AlarmDBHelper.swift
//  AlarmMonster
//
//  Created by 植原　駿 on 2016/02/15.
//  Copyright © 2016年 Shun Uehara. All rights reserved.
//

import Foundation

class AlarmDBHelper {
    private let DB_PATH:String = "alarm.db"
    private let CREATE_DB_SQL:String = "CREATE TABLE T_ALARM (ID INTEGER PRIMARY KEY AUTOINCREMENT,ALARM TEXT UNIQUE, RUN_FLAG TEXT, REPEAT_FLAG TEXT);"
    
     init() {
        self.createDatabase()
    }
    
    // データベース作成
    func createDatabase () {
        // DBファイルのパス
        let dir:String = self.getDBDirectory()
        // DBファイルがあるか確認
        let fileManager:NSFileManager = NSFileManager.defaultManager()
        if (!fileManager.fileExistsAtPath(dir.stringByAppendingString(DB_PATH))) {
            // DBファイルがない場合、新規作成
            let db:FMDatabase = self.getAlarmDatabase()
            // DB接続
            db.open()
            // SQL実行
            db.executeStatements(CREATE_DB_SQL)
            // DB切断
            db.close()
        }
    }
    
    // DBDirectoryの取得
    func getDBDirectory() -> String {
        return NSSearchPathForDirectoriesInDomains(
            NSSearchPathDirectory.DocumentDirectory,
            NSSearchPathDomainMask.AllDomainsMask,
            true).first!
    }
    
    // 全件取得
    func selectAll() -> [Dictionary<String, String>] {
        // データベースオブジェクトの取得
        let db:FMDatabase = self.getAlarmDatabase()
        // SQL作成
        let sql:String = "SELECT * FROM t_alarm ORDER BY alarm ASC;"
        // DB接続
        db.open()
        // SQL実行
        let resultSet:FMResultSet = db.executeQuery(sql, withArgumentsInArray: nil)
        
        var alarmArray:[Dictionary<String, String>] = [Dictionary<String, String>]()
        while (resultSet.next()) {
            var dic:Dictionary<String, String> = Dictionary<String, String>()
            dic["ID"] = resultSet.stringForColumn("ID")
            dic["ALRAM"] = resultSet.stringForColumn("ALARM")
            dic["RUN_FLAG"] = resultSet.stringForColumn("RUN_FLAG")
            dic["REPEAT_FLAG"] = resultSet.stringForColumn("REPEAT_FLAG")
            
            alarmArray.append(dic)
        }
        db.close()
        
        return alarmArray
        
    }
    
    // 追加
    func insert(dic:Dictionary<String, String>) -> Bool {
        // データベースオブジェクトの取得
        let db:FMDatabase = self.getAlarmDatabase()
        // SQL作成
        let sql:String = "INSERT INTO T_ALARM (ALARM, RUN_FLAG, REPEAT_FLAG) VALUES (?,?,?)"
        // DB接続
        db.open()
        // トランザクション開始
        db.beginTransaction()
        // SQL実行
        let result:Bool = db.executeUpdate(
            sql, withArgumentsInArray: [dic["ALARM"]!,
                                        dic["RUN_FLAG"]!,
                                        dic["REPEAT_FLAG"]!])
        if (result) {
            // コミット
            db.commit()
        } else {
            // ロールバック
            db.rollback()
        }
        // DB切断
        db.close()
        
        return result
    }
    
    // 更新
    func update(dic:Dictionary<String, String>) -> Bool {
        // データベースオブジェクトの取得
        let db:FMDatabase = self.getAlarmDatabase()
        // SQL作成
        let sql:String = "UPDATE T_ALARM SET ALARM = ?, RUN_FLAG = ?, REPEAT_FLAG = ? WHERE ID = ?"
        // DB接続
        db.open()
        // トランザクション開始
        db.beginTransaction()
        // SQL実行
        let result:Bool = db.executeUpdate(
            sql, withArgumentsInArray: [dic["ALARM"]!,
                                        dic["RUN_FLAG"]!,
                                        dic["REPEAT_FLAG"]!,
                                        dic["ID"]!])
        if (result) {
            // コミット
            db.commit()
        } else {
            // ロールバック
            db.rollback()
        }
        return result
    }
    
    // 削除
    func delete(dic:Dictionary<String, String>) -> Bool {
        // データベースオブジェクトの取得
        let db:FMDatabase = self.getAlarmDatabase()
        // SQL作成
        let sql:String = "DELETE FROM T_ALARM WHERE ID = ?"
        // DB接続
        db.open()
        // トランザクション開始
        db.beginTransaction()
        // SQL実行
        let result:Bool = db.executeUpdate(
            sql, withArgumentsInArray: [dic["ID"]!])
        if (result) {
            // コミット
            db.commit()
        } else {
            // ロールバック
            db.rollback()
        }
        return result
    }
    
    // １件取得
    func select(alarmId:Int) -> Dictionary<String, String> {
        return Dictionary<String, String>()
    }
    
    // Alarmデータベースの新規作成
    func getAlarmDatabase() -> FMDatabase {
        let writableDBPath: String = self.getDBDirectory().stringByAppendingString(DB_PATH)
        return FMDatabase(path: writableDBPath)
    }
    
}