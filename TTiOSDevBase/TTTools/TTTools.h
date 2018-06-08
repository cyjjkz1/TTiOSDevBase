//
//  TTTools.h
//  TTiOSDevBase
//
//  Created by mac on 2018/6/7.
//  Copyright © 2018年 zhougang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface TTTools : NSObject
+ (CGFloat)getWidthFromText:(NSString *)text fontSize:(CGFloat)font maxWidth:(CGFloat)width maxHeight:(CGFloat)height;
@end
