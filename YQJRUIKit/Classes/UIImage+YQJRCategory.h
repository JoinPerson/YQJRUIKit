//
//  UIImage+YQJRCategory.h
//  Pods-YQJRUIKit_Example
//
//  Created by wangzhen on 2019/9/23.
//

#import <UIKit/UIKit.h>

@interface UIImage (YQJRCategory)

/**
 根据传入的颜色、宽度、高度生成一张图片(传入的参数如果有问题会返回nil)
 
 @param color 颜色
 @param width 宽度
 @param height 高度
 @return 返回一张颜色图片
 */
+ (UIImage *)yqjr_imageWithColor:(UIColor *)color
                           width:(CGFloat)width
                          height:(CGFloat)height;

+ (UIImage *)yqjr_getImageFromView:(UIView *)view;

+ (UIImage *)yqjr_normalizedImage:(UIImage *)image;

+ (UIImage *)yqjr_fixOrientationImage:(UIImage *)image;

@end
