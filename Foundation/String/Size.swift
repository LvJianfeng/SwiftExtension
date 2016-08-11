//
//  String+Size.swift
//  SwiftCategory
//
//  Created by LvJianfeng on 16/8/11.
//  Copyright © 2016年 LvJianfeng. All rights reserved.
//

import Foundation
import UIKit

extension String{
    
    //MARK:计算文本高度（需约束宽度）
    func heightOfText(font: UIFont?, width: CGFloat) -> CGFloat {
        let textFont: UIFont = font==nil ? font! : UIFont.systemFontOfSize(UIFont.systemFontSize())
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .ByWordWrapping
        let attributes = [NSFontAttributeName : textFont, NSParagraphStyleAttributeName: paragraph]
        let textSize: CGSize = (self as NSString).boundingRectWithSize(CGSizeMake(width,CGFloat.max), options:[.UsesLineFragmentOrigin,.TruncatesLastVisibleLine], attributes: attributes, context: nil).size
        
        return ceil(textSize.height)
    }
    
    
    //MARK:计算文本宽度（需约束高度）
    func widthOfText(font: UIFont?, height: CGFloat) -> CGFloat {
        let textFont: UIFont = font==nil ? font! : UIFont.systemFontOfSize(UIFont.systemFontSize())
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .ByWordWrapping
        let attributes = [NSFontAttributeName : textFont, NSParagraphStyleAttributeName: paragraph]
        let textSize: CGSize = (self as NSString).boundingRectWithSize(CGSizeMake(CGFloat.max,height), options:[.UsesLineFragmentOrigin,.TruncatesLastVisibleLine], attributes: attributes, context: nil).size
        
        return ceil(textSize.width)
    }
    
    //MARK:计算文字大小(约束宽度)
    func sizeWifhText(font: UIFont?, width: CGFloat) -> CGSize {
        let textFont: UIFont = font==nil ? font! : UIFont.systemFontOfSize(UIFont.systemFontSize())
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .ByWordWrapping
        let attributes = [NSFontAttributeName : textFont, NSParagraphStyleAttributeName: paragraph]
        return (self as NSString).boundingRectWithSize(CGSizeMake(width,CGFloat.max), options:[.UsesLineFragmentOrigin,.TruncatesLastVisibleLine], attributes: attributes, context: nil).size
    }
    
    //MARK:计算文字大小(约束高度)
    func sizeWifhText(font: UIFont?, height: CGFloat) -> CGSize {
        let textFont: UIFont = font==nil ? font! : UIFont.systemFontOfSize(UIFont.systemFontSize())
        
        let paragraph = NSMutableParagraphStyle()
        paragraph.lineBreakMode = .ByWordWrapping
        let attributes = [NSFontAttributeName : textFont, NSParagraphStyleAttributeName: paragraph]
        return (self as NSString).boundingRectWithSize(CGSizeMake(CGFloat.max, height), options:[.UsesLineFragmentOrigin,.TruncatesLastVisibleLine], attributes: attributes, context: nil).size
    }
}