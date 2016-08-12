//
//  Validate.swift
//  SwiftCategory
//
//  Created by LvJianfeng on 16/8/12.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

import Foundation

extension String{
    
    //MARK: 验证纯数字
    func validateNumber() -> Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "^[0-9]*$").evaluateWithObject(self)
    }
    
    //MARK: 验证18位身份证号
    func validateIDNumber() -> Bool {
        if self.characters.count != 18 { return false }
        return NSPredicate.init(format: "SELF MATCHES %@", "^(\\d{14}|\\d{17})(\\d|[xX])$").evaluateWithObject(self)
    }
    
    //MARK: 验证18位身份证号(严格)
    func validateIDNumberStrict() -> Bool {
        if self.characters.count != 18 { return false }
        let flag: Bool = NSPredicate.init(format: "SELF MATCHES %@", "^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$").evaluateWithObject(self)
        //如果通过该验证，说明身份证格式正确，但准确性还需计算
        let idNumber: NSString = self as NSString
        if flag {
            //将前17位加权因子保存在数组里
            let idCardArray = ["7", "9", "10", "5", "8", "4", "2", "1", "6", "3", "7", "9", "10", "5", "8", "4", "2"]
            //这是除以11后，可能产生的11位余数、验证码，也保存成数组
            let idCardYArray = ["1", "0", "10", "9", "8", "7", "6", "5", "4", "3", "2"]
            
            var idCardWiSum = 0
            
            for index in 0...17 {
                let subStrIndex: NSInteger = NSInteger(idNumber.substringWithRange(NSMakeRange(index, 1)))!
                let idCardWiIndex: NSInteger = NSInteger(idCardArray[index])!
                
                idCardWiSum += subStrIndex * idCardWiIndex
            }
            //计算出校验码所在数组的位置
            let idCardMod = idCardWiSum % 11
            //得到最后一位身份证号码
            let idCardLast = idNumber.substringWithRange(NSMakeRange(17, 1))
            //如果等于2，则说明校验码是10，身份证号码最后一位应该是X
            if idCardMod==2 {
                if idCardLast.lowercaseString != "x" {
                    return false
                }
                return flag
            }else{
                //用计算出的验证码与最后一位身份证号码匹配，如果一致，说明通过，否则是无效的身份证号码
                if idCardLast != idCardYArray[idCardMod] {
                    return false
                }
                return flag
            }
        }else{ return flag }
    }
    
    //MARK: 验证邮箱
    func validateEmail() -> Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}").evaluateWithObject(self)
    }
    
    //MARK: 验证手机号码（11纯数字）弱
    func validateMobilePhone() -> Bool {
        //修改成必须1开头的，第二个为3～8的数字
        return NSPredicate.init(format: "SELF MATCHES %@", "^[1][3-8]\\d{9}$").evaluateWithObject(self)
    }
    
    //MARK: 验证电话号码号码:格式为：XXXX-XXXXXXX，XXXX-XXXXXXXX，XXX-XXXXXXX，XXX-XXXXXXXX，XXXXXXX，XXXXXXXX
    func validateTelePhone() -> Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "^(\\(\\d{3,4}\\)|\\d{3,4}-)?\\d{7,8}$").evaluateWithObject(self)
    }
    
    //MARK: 验证电话号码或者手机号码
    func validatePhone() -> Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "(\\d{3}-\\d{8}|\\d{4}-\\d{7})｜(^((\\(\\d{3}\\))|(\\d{3}\\-))?13\\d{9}|15[89]\\d{8}$)").evaluateWithObject(self)
    }
    
    //MARK: 验证密码：以字母开头，长度在8-16之间，只能包含字符、数字和下划线//6-18^[a-zA-Z]\\w{7,15}$
    func validatePassword() -> Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "^(?![0-9]+$)(?![a-zA-Z]+$)[0-9A-Za-z]{8,16}$").evaluateWithObject(self)
    }
    
    //MARK: 验证验证码(6位数字)
    func validateVerifyCode() -> Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "^\\d{6}$").evaluateWithObject(self)
    }
    
    //MARK: 是否有中文
    func validateExistChinese() -> Bool {
        return NSPredicate.init(format: "SELF MATCHES %@", "^[\\u4e00-\\u9fa5]{2,10}").evaluateWithObject(self)
    }
    
}