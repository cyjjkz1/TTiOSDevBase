//
//  define.h
//  TTiOSDevBase
//
//  Created by mac on 2018/6/7.
//  Copyright © 2018年 zhougang. All rights reserved.
//

#ifndef define_h
#define define_h

/*
 * rgb颜色转换（16进制->10进制）
 */
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]


#define UIColorFromRGBWithAlpha(rgbValue,alpha) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:(alpha)]

#define RGBCOLOR(r,g,b) [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1]

/*
 * 设备的⾼高度
 */
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height //设备的宽度
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width


/*
 * 新定义适配iPhone X
 */

/*
 * iPhone X
 */
#define Is_Iphone       (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define Is_Iphone_X     (Is_Iphone && ScreenHeight == 812.0)
#define NaviHeight      (Is_Iphone_X ? 88 : 64)
#define StatusBarHeight (Is_Iphone_X ? 44 : 20)
#define TabbarHeight    (Is_Iphone_X ? 83 : 49)
#define BottomHeight    (Is_Iphone_X ? 34 : 0)

/*
 * kit width 以5s为基准
 */
#define AdaptWidth(__width) ((__width/320.f)*ScreenWidth)
#define AdaptHeight(__height) ((__height/568.f)*ScreenHeight)

/*
 * kit width 以6为基准
 */
#define AdaptWidth6Standard(__width) ((__width/375.f)*ScreenWidth)
#define AdaptHeight6Standard(__height) ((__height/667.f)*ScreenHeight)//iphone4的文字等可以按比例来
#define AdaptHeight6StandardNot4(__height) ((__height/667.f)*(ScreenHeight<568 ? 568 : ScreenHeight))//iphone4的cell高度等以5为标准



#endif /* define_h */
