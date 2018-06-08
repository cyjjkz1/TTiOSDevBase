//
//  UIViewController+NavigationBar.m
//  TTiOSDevBase
//
//  Created by mac on 2018/6/7.
//  Copyright © 2018年 zhougang. All rights reserved.
//

#import "UIViewController+NavigationBar.h"
#import "define.h"
#import "UIView+QuickFrame.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import "TTBackButton.h"
#import "TTCloseAllButton.h"

/**
 * 导航栏相关view对应的tag
 */
#define kTTNavigationBarTag 20000
#define kTTNavigationMiddleItemTag 20001
#define kTTNavigationBackItemTag 20002
#define kTTNavigationCloseAllItemTag 20003
/**
 * 导航栏使用的字体大小
 */
#define kNavigationBarFontSize 15

/**
 * 导航栏中间标题使用图片的宽度
 */
#define kMiddleImageViewWidth 132
@implementation UIViewController (NavigationBar)

- (void)userDefaultNavigationBar
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.hidden = YES;
    [self addTTNavigationBar];
    [self setTTNavigationBarBackgroundColor:[[UIColor redColor] colorWithAlphaComponent:1.0]];
//    [self setMiddieItemWithTittle:@"消息中心"];
    [self setMiddleItemWithImageUrl:@"https://www.baidu.com/img/bd_logo1.png?where=super"];
    [self setBackButton];
    [self setBackRootControllerButton];
}

- (void)addTTNavigationBar{
    UIView *ttNavigationBar = [self.view viewWithTag:kTTNavigationBarTag];
    if (!ttNavigationBar) {
        ttNavigationBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, NaviHeight)];
        ttNavigationBar.userInteractionEnabled = YES;
        ttNavigationBar.tag = kTTNavigationBarTag;
        [self.view insertSubview:ttNavigationBar atIndex:0];
    }
}
- (UIView *)ttNavigationBar
{
    UIView *ttNavigationBar = [self.view viewWithTag:kTTNavigationBarTag];
    return ttNavigationBar;
}
- (void)setTTNavigationBarBackgroundColor:(UIColor *)bkColor
{
    UIView *ttNavigationBar = [self ttNavigationBar];
    ttNavigationBar.backgroundColor = bkColor;
}
- (void)setTTNavigationBarBackgroundImage:(UIImage *)bkImage
{
    UIImageView *ttNavigationBar = (UIImageView *)[self ttNavigationBar];
    [ttNavigationBar setImage:bkImage];
}


#pragma mark -
#pragma mark 设置导航栏中间的item
- (void)setMiddieItemWithTittle:(NSString *)midTitle
{
    UIView *ttNavigationBar = [self ttNavigationBar];
    if (!ttNavigationBar) {
        [self addTTNavigationBar];
    }
    UILabel *label = (UILabel *)[ttNavigationBar viewWithTag:kTTNavigationMiddleItemTag];
    if (!label) {
        label = [[UILabel alloc] initWithFrame:CGRectZero];
        label.font = [UIFont systemFontOfSize:kNavigationBarFontSize];
        label.textAlignment = NSTextAlignmentCenter;
        [label sizeToFit];
        [ttNavigationBar addSubview:label];
    }
    label.text = midTitle;
    label.center = CGPointMake(ttNavigationBar.center.x, (NaviHeight -StatusBarHeight)/2.0 + StatusBarHeight);

}
- (UIImageView *)getMiddleItemImageView{
    UIView *ttNavigationBar = [self ttNavigationBar];
    if (!ttNavigationBar) {
        [self addTTNavigationBar];
    }
    UIImageView *midImageView = (UIImageView *)[ttNavigationBar viewWithTag:kTTNavigationMiddleItemTag];
    if (!midImageView) {
        CGFloat imageViewHeight = NaviHeight - StatusBarHeight - 4;
        midImageView = [[UIImageView alloc] initWithFrame:CGRectMake((ttNavigationBar.w - kMiddleImageViewWidth)/2, 2+StatusBarHeight, kMiddleImageViewWidth, imageViewHeight)];
        midImageView.userInteractionEnabled = YES;
        midImageView.backgroundColor = [UIColor clearColor];
        [ttNavigationBar addSubview:midImageView];
    }
    return midImageView;
}
- (void)setMiddleItemWithImage:(UIImage *)midImage
{
    UIImageView *midImageView = [self getMiddleItemImageView];
    [midImageView setImage:midImage];
    
}
- (void)setMiddleItemWithImageUrl:(NSString *)urlString
{
    UIImageView *midImageView = [self getMiddleItemImageView];
    [midImageView sd_setImageWithURL:[NSURL URLWithString:urlString]];
}
#pragma mark -
#pragma 导航栏左边返回按钮
- (void)setBackButton
{
    UIView *ttNavigationBar = [self ttNavigationBar];
    if (!ttNavigationBar) {
        [self addTTNavigationBar];
    }
    TTBackButton *backBtn = (TTBackButton *) [ttNavigationBar viewWithTag:kTTNavigationBackItemTag];
    if (!backBtn) {
        backBtn = [[TTBackButton alloc] initWithFrame:CGRectMake(0, StatusBarHeight, NaviHeight - StatusBarHeight - 6, NaviHeight - StatusBarHeight)];
        backBtn.backgroundColor = [UIColor clearColor];
        backBtn.tag  = kTTNavigationBackItemTag;
        [backBtn addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backAction)]];
        [ttNavigationBar addSubview:backBtn];
    }
}
#pragma 可重载此方法改变返回事件的业务逻辑  ？？
- (void)backAction{
    NSArray *vcArray = self.navigationController.viewControllers;
    if ([vcArray count] >= 2) {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

#pragma mark -
#pragma 导航栏左边直接返回到根的按钮

- (void)setBackRootControllerButton
{
    UIView *ttNavigationBar = [self ttNavigationBar];
    if (!ttNavigationBar) {
        [self addTTNavigationBar];
    }
    TTBackButton *backBtn = (TTBackButton *) [ttNavigationBar viewWithTag:kTTNavigationBackItemTag];
    if (!backBtn) {
        [self setBackButton];
    }
    backBtn = (TTBackButton *) [ttNavigationBar viewWithTag:kTTNavigationBackItemTag];
    TTCloseAllButton *closeAllBtn = [ttNavigationBar viewWithTag:kTTNavigationCloseAllItemTag];
    if (!closeAllBtn) {
        closeAllBtn = [[TTCloseAllButton alloc] initWithFrame:CGRectMake(backBtn.maxX, StatusBarHeight + 4, 36, 36)];
        closeAllBtn.backgroundColor = [UIColor clearColor];
        closeAllBtn.tag = kTTNavigationCloseAllItemTag;
        [closeAllBtn addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeAllControllerAction)]];
        [ttNavigationBar addSubview:closeAllBtn];
    }
    
}
- (void)closeAllControllerAction
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}
@end
