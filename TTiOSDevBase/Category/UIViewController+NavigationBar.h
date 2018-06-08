//
//  UIViewController+NavigationBar.h
//  TTiOSDevBase
//
//  Created by mac on 2018/6/7.
//  Copyright © 2018年 zhougang. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *
 */
@interface UIViewController (NavigationBar)
/**
 *  默认的自定义的导航栏的样式
 *  如果想自定义新的导航栏可重载此方法
 *  或者在此基础上添加新的扩展
 */
- (void)userDefaultNavigationBar;

/**
 *
 */
- (void)addTTNavigationBar;

/**
 * 给自定义的导航栏设置背景颜色
 */
- (void)setTTNavigationBarBackgroundColor:(UIColor *)bkColor;

/**
 * 给自定义的导航栏设置背景图
 */
- (void)setTTNavigationBarBackgroundImage:(UIImage *)bkImage;
- (void)setTTNavigationBarBackgroundImageWithUrl:(NSString *)urlString;

/**
 * 获取自定义的导航栏
 */
- (UIView *)ttNavigationBar;

/**
 * 设置导航栏中间标题
 */
- (void)setMiddieItemWithTittle:(NSString *)midTitle;
- (void)setMiddleItemWithImage:(UIImage *)midImage;
- (void)setMiddleItemWithImageUrl:(NSString *)urlString;

/**
 * 设置返回按钮和返回到根视图的按钮
 */
- (void)setBackButton;

- (void)setBackRootControllerButton;
@end
