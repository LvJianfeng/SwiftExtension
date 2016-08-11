//
//  NSDate+TimeAgo.swift
//  SwiftCategory
//
//  Created by LvJianfeng on 16/8/11.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//
//  OC源码传送门:https://github.com/kevinlawler/NSDate-TimeAgo

import Foundation

private let now = NSDate()

extension NSDate{
    
    func timeAgoSimple() -> String {
        let deltaSeconds: Double = fabs(NSDate().timeIntervalSinceDate(now))
        let deltaMinutes = deltaSeconds / 60.0
        
        let tupleData = (deltaSeconds, deltaMinutes)
        
        var value:Int = 0;
        
        switch tupleData {
        case let (s, _) where s < 5:
            return "刚刚"
            
        case let (s, _) where s < 60:
            return String.init(format: "%d秒前", s)
            
        case let (_, m) where m < 60:
            return String.init(format: "%d分钟前", m)
            
        case let (_, m) where m < (24 * 60):
            value = Int(floor(m/60))
            return String.init(format: "%d小时前", value)
         
        case let (_, m) where m < (24 * 60 * 2):
            return "昨天"
            
        case let (_, m) where m < (24 * 60 * 7):
            value = Int(floor(m/(60 * 24)))
            return String.init(format: "%d天前", value)
            
        case let (_, m) where m < (24 * 60 * 14):
            return "上周"
            
        case let (_, m) where m < (24 * 60 * 31):
            value = Int(floor(m/(60 * 24 * 7)))
            return String.init(format: "%d周前", value)
            
        case let (_, m) where m < (24 * 60 * 61):
            return "上个月"
            
        case let (_, m) where m < (24 * 60 * 365.25):
            value = Int(floor(m/(60 * 24 * 30)))
            return String.init(format: "%d月前", value)
            
        case let (_, m) where m < (24 * 60 * 731):
            return "去年"
            
        default:
            value = Int(floor(deltaMinutes/(60 * 24 * 365)))
            return String.init(format: "%d年", value)
        }
    }
}


//func stringFromFormat(format: String, value: NSInteger) -> String {
//    return String
//}