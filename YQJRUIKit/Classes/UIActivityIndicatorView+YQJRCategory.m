//
//  UIActivityIndicatorView+YQJRCategory.m
//  Pods-YQJRUIKit_Example
//
//  Created by wangzhen on 2019/9/23.
//

#import "UIActivityIndicatorView+YQJRCategory.h"

@implementation UIActivityIndicatorView (YQJRCategory)

static NSMapTable *mapTableForUIActivityIndicatorViewYQJRCategory = nil;

+ (void)yqjr_loadingWithSuperview:(UIView *)superview {
    [self yqjr_loadingWithSuperview:superview indicatorStyle:UIActivityIndicatorViewStyleWhite indicatorColor:nil maskViewColor:[UIColor clearColor] offsetCenterY:0];
}

+ (void)yqjr_loadingWithSuperview1:(UIView *)superview {
    [self yqjr_loadingWithSuperview:superview indicatorStyle:UIActivityIndicatorViewStyleWhite indicatorColor:[UIColor blackColor] maskViewColor:[UIColor clearColor] offsetCenterY:0];
}

+ (void)yqjr_loadingWithSuperview:(UIView *)superview
                   indicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle
                    maskViewColor:(UIColor *)maskViewColor
                    offsetCenterY:(CGFloat)offsetCenterY {
    [self yqjr_loadingWithSuperview:superview indicatorStyle:indicatorStyle indicatorColor:nil maskViewColor:maskViewColor offsetCenterY:offsetCenterY];
}

+ (void)yqjr_loadingWithSuperview:(UIView *)superview
                   indicatorColor:(UIColor *)indicatorColor
                    maskViewColor:(UIColor *)maskViewColor
                    offsetCenterY:(CGFloat)offsetCenterY {
    [self yqjr_loadingWithSuperview:superview indicatorStyle:UIActivityIndicatorViewStyleWhite indicatorColor:indicatorColor maskViewColor:maskViewColor offsetCenterY:offsetCenterY];
}

+ (void)yqjr_loadingWithSuperview:(UIView *)superview
                   indicatorStyle:(UIActivityIndicatorViewStyle)indicatorStyle
                   indicatorColor:(UIColor *)indicatorColor
                    maskViewColor:(UIColor *)maskViewColor
                    offsetCenterY:(CGFloat)offsetCenterY {
    if (mapTableForUIActivityIndicatorViewYQJRCategory == nil) {
        mapTableForUIActivityIndicatorViewYQJRCategory = [NSMapTable weakToWeakObjectsMapTable];
    }
    
    if (superview == nil || ![superview isKindOfClass:[UIView class]]) return;
    if (maskViewColor == nil || ![maskViewColor isKindOfClass:[UIColor class]]) return;
    
    //防止多次调用方法导致多次添加
    if ([mapTableForUIActivityIndicatorViewYQJRCategory objectForKey:superview]) return;
    
    //遮罩视图
    UIView  *maskView = [[UIView alloc] initWithFrame:superview.bounds];
    maskView.backgroundColor = maskViewColor;
    
    //添加遮罩视图
    [superview addSubview:maskView];
    
    [mapTableForUIActivityIndicatorViewYQJRCategory setObject:maskView forKey:superview];
    
    //活动指示器视图
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:indicatorStyle];
    if (indicatorColor != nil && [indicatorColor isKindOfClass:[UIColor class]]) {
        indicatorView.color = indicatorColor;
    }
    
    //添加活动指示器视图
    [maskView addSubview:indicatorView];
    
    //设活动指示器center
    CGFloat centerX = maskView.bounds.size.width * 0.5;
    CGFloat centerY = maskView.bounds.size.height * 0.5;
    indicatorView.center = CGPointMake(centerX, centerY + offsetCenterY);
    
    //活动指示器视图开始动画
    [indicatorView startAnimating];
}

+ (void)yqjr_finishLoadingWithSuperview:(UIView *)superview {
    if (superview == nil || ![superview isKindOfClass:[UIView class]]) return;
    
    UIView *maskView = [mapTableForUIActivityIndicatorViewYQJRCategory objectForKey:superview];
    [maskView removeFromSuperview];
    
    [mapTableForUIActivityIndicatorViewYQJRCategory removeObjectForKey:superview];
}

@end
