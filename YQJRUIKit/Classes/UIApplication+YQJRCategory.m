//
//  UIApplication+YQJRCategory.m
//  YQJRUIKit
//
//  Created by wangzhen on 2020/6/15.
//

#import "UIApplication+YQJRCategory.h"

@implementation UIApplication (YQJRCategory)

+ (CGRect)yqjr_statusBarFrame {
    return [UIApplication sharedApplication].statusBarFrame;
}

+ (UIEdgeInsets)yqjr_safeAreaInsets {
    if (@available(iOS 11.0, *)) {
        return [UIApplication sharedApplication].keyWindow.safeAreaInsets;
    } else {
        return UIEdgeInsetsMake([self yqjr_statusBarFrame].size.height, 0, 0, 0);
    }
}

@end
