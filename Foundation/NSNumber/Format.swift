//
//  Format.swift
//  SwiftCategory
//
//  Created by LvJianfeng on 16/8/12.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

import Foundation

private let formatter: NSDateFormatter = NSDateFormatter()

extension NSNumber{
    //MARK:-
    //MARK: 时间戳的格式化 （秒）
    //MARK:- YYYY-MM-dd
    func formatYYYYMMDD() -> String {
        assert(!(Double(self) <= 0),"时间秒数错误：double<=0")
        formatter.dateFormat = "YYYY-MM-dd"
        let date = NSDate(timeIntervalSince1970: Double(self))
        return formatter.stringFromDate(date)
    }
    
    //MARK: YYYY-MM-dd HH:mm:ss
    func formatYYYYMMDDHHMMSS() -> String {
        assert(!(Double(self) <= 0),"时间秒数错误：double<=0")
        formatter.dateFormat = "YYYY-MM-dd HH:mm:ss"
        let date = NSDate(timeIntervalSince1970: Double(self))
        return formatter.stringFromDate(date)
    }
    
    //MARK: YYYY/MM/dd
    func formateDateYYYYMMDDByDiagonal() -> String {
        assert(!(Double(self) <= 0),"时间秒数错误：double<=0")
        formatter.dateFormat = "YYYY/MM/dd"
        let date = NSDate(timeIntervalSince1970: Double(self))
        return formatter.stringFromDate(date)
    }
    
    //MARK: YYYY/MM/dd HH:mm:ss
    func formateDateYYYYMMDDHHMMSSByDiagonal() -> String {
        assert(!(Double(self) <= 0),"时间秒数错误：double<=0")
        formatter.dateFormat = "YYYY/MM/dd HH:mm:ss"
        let date = NSDate(timeIntervalSince1970: Double(self))
        return formatter.stringFromDate(date)
    }
    
    //MARK: YYYY年MM月dd日
    func formateDateYYYYMMDDZH() -> String {
        assert(!(Double(self) <= 0),"时间秒数错误：double<=0")
        formatter.dateFormat = "YYYY年MM月dd日"
        let date = NSDate(timeIntervalSince1970: Double(self))
        return formatter.stringFromDate(date)
    }
    
    //MARK: YYYY年MM月dd日 EEEE
    func formateDateYYYYMMDDEEEEZH() -> String {
        assert(!(Double(self) <= 0),"时间秒数错误：double<=0")
        formatter.dateFormat = "YYYY年MM月dd日 EEEE"
        let date = NSDate(timeIntervalSince1970: Double(self))
        return formatter.stringFromDate(date)
    }
    
    //MARK:-
    //MARK: 数值小数位保留
    //MARK:-
    //MARK: 输出字符串格式
    func toString() -> String {
        return String(self)
    }
    
    //MARK: 保留两位小数
    func to2fString() -> String {
        return String(format: "%.2lf", roundingDownAfterPoint(2))
    }
    
    //MARK: 保留三位小数
    func to3fString() -> String {
        return String(format: "%.3lf", roundingDownAfterPoint(3))
    }
    
    //MARK: 保留四位小数
    func to4fString() -> String {
        return String(format: "%.4lf", roundingDownAfterPoint(4))
    }
    
    //MARK: 保留两位小数的百分比
    func to1fPercentageString() -> String {
        return String(format: "%.1lf%%", roundingDownAfterPointPrecentage(3))
    }
    
    //MARK: 保留两位小数的百分比
    func to2fPercentageString() -> String {
        return String(format: "%.2lf%%", roundingDownAfterPointPrecentage(4))
    }
    
    
    //MARK:-
    /**
     *  向零方向舍入的舍入模式。从不对舍弃部分前面的数字加 1（即截尾）。注意，此舍入模式始终不会增加计算值的绝对值。
     */
    private func roundingDownAfterPoint(postion: Int16) -> Double {
        let roundingBehavior = NSDecimalNumberHandler.init(roundingMode: .RoundDown, scale: postion, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        
        let ouncesdecimal = NSDecimalNumber(string: toString())
        let roundedOunces = ouncesdecimal.decimalNumberByRoundingAccordingToBehavior(roundingBehavior)
        
        //test
        print("round double value is \(roundedOunces.doubleValue)")
        return roundedOunces.doubleValue
    }
    
    private func roundingDownAfterPointPrecentage(postion: Int16) -> Double {
        let roundingBehavior = NSDecimalNumberHandler.init(roundingMode: .RoundDown, scale: postion, raiseOnExactness: false, raiseOnOverflow: false, raiseOnUnderflow: false, raiseOnDivideByZero: true)
        
        let ouncesdecimal = NSDecimalNumber(string: toString())
        let roundedOunces = ouncesdecimal.decimalNumberByRoundingAccordingToBehavior(roundingBehavior)
        
        //test
        print("round precentage double value is \(roundedOunces.doubleValue*100)")
        return roundedOunces.doubleValue*100
    }
}