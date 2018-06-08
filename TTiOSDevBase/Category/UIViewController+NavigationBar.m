//
//  UIViewController+NavigationBar.m
//  TTiOSDevBase
//
//  Created by mac on 2018/6/7.
//  Copyright © 2018年 zhougang. All rights reserved.
//

#import "UIViewController+NavigationBar.h"
#import "define.h"

#define kTTNavigationBarTag 20000

@implementation UIViewController (NavigationBar)

- (void)userDefaultNavigationBar
{
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.hidden = YES;
    [self addTTNavigationBar];
    [self setTTNavigationBarBackgroundColor:[[UIColor whiteColor] colorWithAlphaComponent:0.6]];
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
    UIView *ttNavigationBar = [self.view viewWithTag:kTTNavigationBarTag];
    ttNavigationBar.backgroundColor = bkColor;
}
- (void)setTTNavigationBarBackgroundImage:(UIImage *)bkImage
{
    UIImageView *ttNavigationBar = (UIImageView *)[self.view viewWithTag:kTTNavigationBarTag];
    [ttNavigationBar setImage:bkImage];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
