//
//  UIImage+YQJRCategory.m
//  Pods-YQJRUIKit_Example
//
//  Created by wangzhen on 2019/9/23.
//

#import "UIImage+YQJRCategory.h"

@implementation UIImage (YQJRCategory)

+ (UIImage *)yqjr_imageWithColor:(UIColor *)color
                           width:(CGFloat)width
                          height:(CGFloat)height {
    
    if (![color isKindOfClass:[UIColor class]]) return nil;
    
    if (width <= 0) return nil;
    
    if (height <= 0) return nil;
    
    CGRect rect = CGRectMake(0.0f, 0.0f, width, height);
    
    UIGraphicsBeginImageContext(rect.size);
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(contextRef, color.CGColor);
    CGContextFillRect(contextRef, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)yqjr_getImageFromView:(UIView *)view {
    if (![view isKindOfClass:UIView.class]) {
        return nil;
    }
    UIGraphicsBeginImageContextWithOptions(view.bounds.size, NO, 0.0);
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

@end
