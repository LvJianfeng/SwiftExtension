//
//  NSDate+Extension.swift
//  SwiftCategory
//
//  Created by LvJianfeng on 16/8/11.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

import Foundation

private let calendar = NSCalendar.currentCalendar()

extension NSDate{
    //MARK:- 年月日时分秒
    //Public
    public var day: NSInteger{
        get{
            return day(self)
        }
    }
    
    public var month: NSInteger{
        get{
            return month(self)
        }
    }
    
    public var year: NSInteger{
        get{
            return year(self)
        }
    }
    
    public var hour: NSInteger{
        get{
            return hour(self)
        }
    }
    
    public var minute: NSInteger{
        get{
            return minute(self)
        }
    }
    
    public var second: NSInteger{
        get{
            return second(self)
        }
    }
    
    //Private
    private func day(date: NSDate) -> NSInteger {
        let dayComponents = calendar.components(.Day, fromDate: date)
        print(dayComponents.day)
        return dayComponents.day
    }
    
    private func month(date: NSDate) -> NSInteger {
        let dayComponents = calendar.components(.Month, fromDate: date)
        return dayComponents.month
    }
    
    private func year(date: NSDate) -> NSInteger {
        let dayComponents = calendar.components(.Year, fromDate: date)
        return dayComponents.year
    }
    
    private func hour(date: NSDate) -> NSInteger {
        let dayComponents = calendar.components(.Hour, fromDate: date)
        return dayComponents.hour
    }
    
    private func minute(date: NSDate) -> NSInteger {
        let dayComponents = calendar.components(.Minute, fromDate: date)
        return dayComponents.minute
    }
    
    private func second(date: NSDate) -> NSInteger {
        let dayComponents = calendar.components(.Second, fromDate: date)
        return dayComponents.second
    }
    
    //MARK:- 返回一年多少天
    //Public
    public var numberOfDaysInYear: NSInteger{
        get{
            return numberOfDaysInYear(self)
        }
    }
    
    public var isLeapYear: Bool{
        get{
            return isLeapYear(self)
        }
    }
    
    //Private
    private func isLeapYear(date: NSDate) -> Bool {
        let y = year(date)
        if (y % 4 == 0 && y % 100 != 0) || y % 400 == 0 {
            return true
        }
        return false
    }
    
    private func numberOfDaysInYear(date: NSDate) -> NSInteger{
        return isLeapYear(date) ? 366 : 365
    }
    
    //MARK:- 格式化yyyy-mm-dd
    //Public
    public var formatYYYYMMDD:String{
        get{
            return formatYYYYMMDD(self)
        }
    }
    
    //Private
    private func formatYYYYMMDD(date:NSDate) -> String{
        return String.init(format: "%lu-%02lu-%02lu", date.year, date.month, date.day)
    }
    
    //MARK:- 获取（年，月）内的第几周
    
}