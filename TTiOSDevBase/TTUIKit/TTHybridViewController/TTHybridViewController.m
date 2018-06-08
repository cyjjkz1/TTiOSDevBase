//
//  TTHybridViewController.m
//  TTiOSDevBase
//
//  Created by mac on 2018/6/7.
//  Copyright © 2018年 zhougang. All rights reserved.
//

#import "TTHybridViewController.h"
#import <WebKit/WebKit.h>
#import "TTWebView.h"
#import "define.h"
#import "UIViewController+NavigationBar.h"
@interface TTHybridViewController ()<UIScrollViewDelegate>
@property (nonatomic, weak) TTWebView *ttWebView;
@end

@implementation TTHybridViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self userDefaultNavigationBar];
    [self viewAddWKWebView];
}
- (void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews];
    self.ttWebView.frame = CGRectMake(0, StatusBarHeight, ScreenWidth, ScreenHeight - BottomHeight - StatusBarHeight);
}
- (void)viewAddWKWebView{
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    configuration.userContentController = [[WKUserContentController alloc] init];
    
    WKPreferences *preferences = [[WKPreferences alloc] init];
    preferences.javaScriptCanOpenWindowsAutomatically = YES;
    preferences.minimumFontSize = 30.0;
    configuration.preferences = preferences;
    
    TTWebView *webView = [[TTWebView alloc] initWithFrame:CGRectMake(0, NaviHeight, ScreenWidth, ScreenHeight - BottomHeight - NaviHeight) configuration:configuration];
    
    NSLog(@"fram = %@", NSStringFromCGRect(webView.frame));
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://www.jianshu.com/p/76ab08089941"]]];
    self.ttWebView = webView;
    self.ttWebView.scrollView.delegate = self;
    [self.view insertSubview:webView belowSubview:[self ttNavigationBar]];
    
 }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    NSLog(@"scrollViewDidScrollToTop");
}
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    return YES;
}

@end
