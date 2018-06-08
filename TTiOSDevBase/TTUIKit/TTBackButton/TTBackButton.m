//
//  TTBackButton.m
//  TTiOSDevBase
//
//  Created by mac on 2018/6/8.
//  Copyright © 2018年 zhougang. All rights reserved.
//

#import "TTBackButton.h"

@implementation TTBackButton
- (void)drawRect:(CGRect)rect
{
    //在视图中画一个左箭头
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    CGContextSaveGState(currentContext);
    [[UIColor whiteColor] setStroke];
    CGContextSetLineWidth(currentContext, 2);
    CGContextMoveToPoint(currentContext, CGRectGetMidX(rect), rect.size.height/4.0);
    CGContextAddLineToPoint(currentContext, CGRectGetMidX(rect)-rect.size.height/4.0, rect.size.height/2.0);
    CGContextAddLineToPoint(currentContext, CGRectGetMidX(rect), (rect.size.height/4.0)*3.0);
    CGContextStrokePath(currentContext);
    CGContextRestoreGState(currentContext);
}
@end
