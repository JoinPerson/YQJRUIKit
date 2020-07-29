//
//  UIFont+YQJRCategory.m
//  YQJRUIKit
//
//  Created by wangzhen on 2020/7/29.
//

#import "UIFont+YQJRCategory.h"

@implementation UIFont (YQJRCategory)

#pragma mark - PingFangSC

+ (UIFont *)yqjr_PingFangSC_Semibold_Size:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Semibold" size:size] ? : [UIFont boldSystemFontOfSize:size];
}

+ (UIFont *)yqjr_PingFangSC_Regular_Size:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Regular" size:size] ? : [UIFont systemFontOfSize:size];
}

+ (UIFont *)yqjr_PingFangSC_Medium_Size:(CGFloat)size {
    return [UIFont fontWithName:@"PingFangSC-Medium" size:size] ? : [UIFont boldSystemFontOfSize:size];
}

#pragma mark - DINCond

+ (UIFont *)yqjr_DINCond_Black_Size:(CGFloat)size {
    return [UIFont fontWithName:@"DINCond-Black" size:size] ? : [UIFont boldSystemFontOfSize:size];
}

+ (UIFont *)yqjr_DINCond_BlackAlternate_Size:(CGFloat)size {
    return [UIFont fontWithName:@"DINCond-BlackAlternate" size:size] ? : [UIFont boldSystemFontOfSize:size];
}

@end
