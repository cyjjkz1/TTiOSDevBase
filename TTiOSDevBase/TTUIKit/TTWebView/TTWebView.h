//
//  TTWebView.h
//  TTiOSDevBase
//
//  Created by mac on 2018/6/7.
//  Copyright © 2018年 zhougang. All rights reserved.
//

#import <WebKit/WebKit.h>

@interface TTWebView : WKWebView

/**
 * 需要加载的URL
 */
@property (nonatomic, copy) NSString *needURLString;

/**
 * web页面中的图片链接数组
 */
@property (nonatomic, strong, readonly) NSMutableArray *imgSrcArray;

/**
 * 进度条
 */
@property (strong, nonatomic) UIProgressView *progressView;

/**
 * 根据URL初始化
 * @param urlString URLString
 * @return WebviewVc实例
 */
- (instancetype)initWithURLString:(NSString *)urlString;

/**
 *  加载本地HTML页面
 *
 *  @param htmlName html页面文件名称
 */
- (void)loadLocalHTMLWithFileName:(nonnull NSString *)htmlName;

@end
