//
//  String+Trims.swift
//  SwiftCategory
//
//  Created by LvJianfeng on 16/8/11.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

import Foundation

extension String{
    //MARK:去除前后空格
    func trimmingWhitespace() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    }
    
    //MARK:去除字符串与空行
    func trimmingWhitespaceAndNewlines() -> String {
        return self.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
    }
    
    //MARK:去除所有空格
    mutating func trimmingAllWhitespace() -> String {
        var tempArray = self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        tempArray = tempArray.filter{
            $0 != ""
        }
        self = tempArray.joinWithSeparator("")
        return self
    }
    
    //MARK:去除所有空格及空行
    mutating func trimmingAllWhitespaceAndNewlines() -> String {
        var tempArray = self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        tempArray = tempArray.filter{
            $0 != ""
        }
        self = tempArray.joinWithSeparator("")
        return self
    }
    
    //MARK:去除所有空格,使用自定义符号连接
    mutating func trimmingAllWhitespaceJoinWithSymbol(symbol: String) -> String {
        var tempArray = self.componentsSeparatedByCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        tempArray = tempArray.filter{
            $0 != ""
        }
        self = tempArray.joinWithSeparator(symbol)
        return self
    }
}