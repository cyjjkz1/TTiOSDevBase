//
//  TTCloseAllButton.m
//  TTiOSDevBase
//
//  Created by mac on 2018/6/8.
//  Copyright © 2018年 zhougang. All rights reserved.
//

#import "TTCloseAllButton.h"

@implementation TTCloseAllButton

- (void)drawRect:(CGRect)rect
{
    //在视图中画一个左箭头
    CGFloat one = rect.size.height/4.0;
    CGFloat three = rect.size.height - rect.size.height/4.0;
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    
    CGContextSaveGState(currentContext);
    [[UIColor whiteColor] setStroke];
    CGContextSetLineWidth(currentContext, 2);
    CGContextMoveToPoint(currentContext, one, one);
    CGContextAddLineToPoint(currentContext, three, three);
    CGContextStrokePath(currentContext);
    CGContextRestoreGState(currentContext);
    
    CGContextSaveGState(currentContext);
    [[UIColor whiteColor] setStroke];
    CGContextSetLineWidth(currentContext, 2);
    CGContextMoveToPoint(currentContext, three, one);
    CGContextAddLineToPoint(currentContext, one, three);
    CGContextStrokePath(currentContext);
    CGContextRestoreGState(currentContext);
}

@end
