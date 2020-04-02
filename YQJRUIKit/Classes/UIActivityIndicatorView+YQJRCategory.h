//
//  UIActivityIndicatorView+YQJRCategory.h
//  Pods-YQJRUIKit_Example
//
//  Created by wangzhen on 2019/9/23.
//

#import <UIKit/UIKit.h>

@interface UIActivityIndicatorView (YQJRCategory)

/**
 用于网络请求时的loading
 
 @param superview 父视图
 */
+ (void)yqjr_loadingWithSuperview:(UIView *)superview;

/**
用于网络请求时的loading(黑色转圈)

@param superview 父视图
*/
+ (void)yqjr_loadingWithSuperview1:(UIView *)superview;

/**
 用于网络请求时的loading
 
 @param superview 父视图
 @param indicatorStyle 指示器的样式
 @param maskViewColor 遮罩视图的颜色
 @param offsetCenterY 中心点Y的偏移
 */
+ (void)yqjr_loadingWithSuperview:(UIView *)superview
                   indicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle
                    maskViewColor:(UIColor *)maskViewColor
                    offsetCenterY:(CGFloat)offsetCenterY;

/**
 用于网络请求时的loading
 
 @param superview 父视图
 @param indicatorColor 指示器的颜色
 @param maskViewColor 遮罩视图的颜色
 @param offsetCenterY 中心点Y的偏移
 */
+ (void)yqjr_loadingWithSuperview:(UIView *)superview
                   indicatorColor:(UIColor *)indicatorColor
                    maskViewColor:(UIColor *)maskViewColor
                    offsetCenterY:(CGFloat)offsetCenterY;

/**
 用于网络请求时的loading
 
 @param superview 父视图
 @param indicatorStyle 指示器的样式
 @param indicatorColor 指示器的颜色
 @param maskViewColor 遮罩视图的颜色
 @param offsetCenterY 中心点Y的偏移
 */
+ (void)yqjr_loadingWithSuperview:(UIView *)superview
                   indicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle
                   indicatorColor:(UIColor *)indicatorColor
                    maskViewColor:(UIColor *)maskViewColor
                    offsetCenterY:(CGFloat)offsetCenterY;

/**
 用于完成网络请求后消除loading
 
 @param superview 父视图
 */
+ (void)yqjr_finishLoadingWithSuperview:(UIView *)superview;

@end
