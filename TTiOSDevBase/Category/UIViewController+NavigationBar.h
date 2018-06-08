//
//  UIViewController+NavigationBar.h
//  TTiOSDevBase
//
//  Created by mac on 2018/6/7.
//  Copyright © 2018年 zhougang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (NavigationBar)
- (void)userDefaultNavigationBar;
- (void)addTTNavigationBar;
- (void)setTTNavigationBarBackgroundColor:(UIColor *)bkColor;
- (void)setTTNavigationBarBackgroundImage:(UIImage *)bkImage;
- (UIView *)ttNavigationBar;

@end
