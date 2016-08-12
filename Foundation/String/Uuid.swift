//
//  Uuid.swift
//  SwiftCategory
//
//  Created by LvJianfeng on 16/8/12.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

import Foundation
import UIKit

extension String{
    
    //MARK: 获取随机UUID
    func UUIDRandom() -> String{
        return NSUUID().UUIDString
    }
    
    //MARK: 获取设备的UUID
    func UUIDDevice() -> String {
        return UIDevice.currentDevice().identifierForVendor!.UUIDString
    }
    
}