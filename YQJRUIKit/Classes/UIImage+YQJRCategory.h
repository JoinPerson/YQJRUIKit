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

/// 根据当前传入的视图用视图上的内容生成一张图片返回
/// @param view 传入的视图
+ (UIImage *)yqjr_getImageFromView:(UIView *)view;

/// 根据当前传入的图片生成一张方向正常的图片
/// @param image 传入的图片参数
+ (UIImage *)yqjr_normalizedImage:(UIImage *)image;

/// 根据当前传入的图片生成一张方向正常的图片
/// @param image 传入的图片参数
+ (UIImage *)yqjr_fixOrientationImage:(UIImage *)image;

@end
