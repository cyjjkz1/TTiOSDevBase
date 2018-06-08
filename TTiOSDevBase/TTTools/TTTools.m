//
//  TTTools.m
//  TTiOSDevBase
//
//  Created by mac on 2018/6/7.
//  Copyright © 2018年 zhougang. All rights reserved.
//

#import "TTTools.h"

@implementation TTTools
/**
 
 获取给定字符串、给定字体大小、预估宽高、获取实际宽度

 @param text 要计算的字符串
 
 @param font 字体大小
 
 @param width 预估宽度
 
 @param height 预估高度
 
 @return 返回计算后实际尺寸宽、高度
 
 */

+ (CGFloat)getWidthFromText:(NSString *)text fontSize:(CGFloat)font maxWidth:(CGFloat)width maxHeight:(CGFloat)height{
    if (!text) {
        return 0;
    }
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil];
    
    return ceil(rect.size.height);
}
@end
