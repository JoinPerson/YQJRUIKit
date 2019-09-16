//
//  UIColor+YQJRCategory.h
//  Pods-YQJRUIKit_Example
//
//  Created by wangzhen on 2019/9/16.
//

#import <UIKit/UIKit.h>

@interface UIColor (YQJRCategory)

/**
 16进制颜色转换为UIColor(传入的参数如果有问题会返回默认的纯黑色)
 
 @param hexString 16进制字符串（可以以0x开头，可以以#开头，也可以就是6位的16进制）
 @param alpha 透明度 取值范围 [0,1]
 @return 16进制字符串对应的颜色
 */
+ (UIColor *)yqjr_colorWithHexString:(NSString *)hexString
                               alpha:(CGFloat)alpha;

+ (UIColor *)yqjr_colorWithHexString:(NSString *)hexString;

/**
 根据传入的r、g、b的值生成UIColor(传入的参数如果有问题会返回默认的纯黑色)
 
 @param r 红色值 取值范围 [0,255]
 @param g 绿色值 取值范围 [0,255]
 @param b 蓝色值 取值范围 [0,255]
 @param a 透明度值 取值范围[0,1]
 @return 返回的颜色值
 */
+ (UIColor *)yqjr_colorWithR:(NSInteger)r
                           g:(NSInteger)g
                           b:(NSInteger)b
                           a:(CGFloat)a;

+ (UIColor *)yqjr_colorWithR:(NSInteger)r
                           g:(NSInteger)g
                           b:(NSInteger)b;

@end
