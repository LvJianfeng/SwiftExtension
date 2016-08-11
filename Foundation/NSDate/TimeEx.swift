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
    
    public var weekDay: NSInteger{
        get{
            return weekDay(self)
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
    
    private func weekDay(date: NSDate) -> NSInteger{
        let dayComponents = calendar.components(.Weekday, fromDate: date)
        return dayComponents.weekday
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
    
    //MARK:- 返回day天后的日期(若day为负数,则为|day|天前的日期)
    //Public
    func dateAfterMonth(month: NSInteger) -> NSDate {
        return dateAfterDaysDate(self, month: month)
    }
    
    func dateAfterDay(day: NSInteger) -> NSDate {
        return dateAfterDaysDate(self, day: day)
    }
    
    //Private
    private func dateAfterDaysDate(date: NSDate, month: NSInteger) -> NSDate{
        let componentsToAdd = NSDateComponents()
        componentsToAdd.month = month;
        let dateAfterMonth = calendar.dateByAddingComponents(componentsToAdd, toDate: date, options:.WrapComponents)
        return dateAfterMonth!
    }
    
    private func dateAfterDaysDate(date: NSDate, day: NSInteger) -> NSDate{
        let componentsToAdd = NSDateComponents()
        componentsToAdd.day = day;
        let dateAfterMonth = calendar.dateByAddingComponents(componentsToAdd, toDate: date, options:.WrapComponents)
        return dateAfterMonth!
    }
    
    
    //MARK:- 获取该月的第一天的日期
    //Public
    public var beginDayOfMonth: NSDate{
        get{
            return beginDayOfMonth(self)
        }
    }
    
    //Private
    private func beginDayOfMonth(date: NSDate) -> NSDate{
        return dateAfterDaysDate(date, day: -date.day+1)
    }
    
    //MARK:- 获取该月的最后一天的日期
    //Public
    public var lastDayOfMonth: NSDate{
        get{
            return lastDayOfMonth(self)
        }
    }
    //Private
    private func lastDayOfMonth(date: NSDate) -> NSDate{
        let lastDate = beginDayOfMonth(date)
        return lastDate.dateAfterMonth(0).dateAfterDay(-1)
    }
    
    //MARK:- 获取星期几
    //Public
    public var weekString: String{
        get{
            return weekOfDay(self)
        }
    }
    //Private
    private func weekOfDay(date: NSDate) -> String{
        switch date.weekDay{
        case 1:
            return "星期天";
        case 2:
            return "星期一";
        case 3:
            return "星期二";
        case 4:
            return "星期三";
        case 5:
            return "星期四";
        case 6:
            return "星期五";
        case 7:
            return "星期六";
        default:
            return "";
        }
    }
    
    //MARK:- 增加n天后的日期
    func dateByAddingDays(days: NSInteger) -> NSDate{
        let dateComponents = NSDateComponents()
        dateComponents.day = days
        let date = calendar.dateByAddingComponents(dateComponents, toDate: self, options: .WrapComponents)
        return date!
    }
    
    //MARK:- 获取指定月份的天数
    //Public
    func daysOfMonth(month: NSInteger) -> NSInteger {
        return daysOfMonth(self, month: month)
    }
    
    //Private
    private func daysOfMonth(date: NSDate, month:NSInteger) -> NSInteger{
        switch month {
        case 1,3,5,7,8,10,12:
            return 31
        case 2:
            return date.isLeapYear ? 29 : 28
        default:
            return 30
        }
    }
    
    //MARK:- 获取当前月份的天数
    //Public
    public var daysOfMonthInDate: NSInteger{
        get{
            return daysOfMonthInDate(self)
        }
    }
    //Private
    private func daysOfMonthInDate(date: NSDate) -> NSInteger{
        return daysOfMonth(date, month: date.month)
    }
}