//
//  UIColor+YQJRCategory.m
//  Pods-YQJRUIKit_Example
//
//  Created by wangzhen on 2019/9/16.
//

#import "UIColor+YQJRCategory.h"

@implementation UIColor (YQJRCategory)

+ (UIColor *)yqjr_colorWithHexString:(NSString *)hexString
                               alpha:(CGFloat)alpha {
    UIColor *defaultColor = [UIColor blackColor];
    
    if (![hexString isKindOfClass:[NSString class]]) {
        return defaultColor;
    }
    
    if (alpha < 0 || alpha > 1) {
        return defaultColor;
    }
    
    NSString *uppercaseString = [hexString uppercaseString];
    
    if (uppercaseString.length < 6) {
        return defaultColor;
    }
    
    if ([uppercaseString hasPrefix:@"0X"]) {
        uppercaseString = [uppercaseString substringFromIndex:2];
    } else if ([uppercaseString hasPrefix:@"#"]) {
        uppercaseString = [uppercaseString substringFromIndex:1];
    }
    
    if ([uppercaseString length] != 6) {
        return defaultColor;
    }
    
    NSRange range;
    range.length = 2;
    range.location = 0;
    NSString *rString = [uppercaseString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [uppercaseString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [uppercaseString substringWithRange:range];
    
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    if (r < 0 || r > 255) {
        return defaultColor;
    }
    
    if (g < 0 || g > 255) {
        return defaultColor;
    }
    
    if (b < 0 || b > 255) {
        return defaultColor;
    }
    
    defaultColor = [UIColor colorWithRed:((float)r / 255.0f)
                                   green:((float)g / 255.0f)
                                    blue:((float)b / 255.0f)
                                   alpha:alpha];
    return defaultColor;
}

+ (UIColor *)yqjr_colorWithHexString:(NSString *)hexString {
    return [self yqjr_colorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)yqjr_colorWithR:(NSInteger)r
                           g:(NSInteger)g
                           b:(NSInteger)b
                           a:(CGFloat)a {
    UIColor *defaultColor = [UIColor blackColor];
    if (r < 0 || r > 255) {
        return defaultColor;
    }
    if (g < 0 || g > 255) {
        return defaultColor;
    }
    if (b < 0 || b > 255) {
        return defaultColor;
    }
    if (a < 0 || a > 1) {
        return defaultColor;
    }
    defaultColor = [UIColor colorWithRed:r / 255.0 green:g /255.0 blue:b / 255.0 alpha:a];
    return defaultColor;
}

+ (UIColor *)yqjr_colorWithR:(NSInteger)r
                           g:(NSInteger)g
                           b:(NSInteger)b {
    return [self yqjr_colorWithR:r g:g b:b a:1.0];
}


@end
