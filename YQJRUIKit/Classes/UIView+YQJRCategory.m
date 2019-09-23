//
//  UIView+YQJRCategory.m
//  Pods-YQJRUIKit_Example
//
//  Created by wangzhen on 2019/9/23.
//

#import "UIView+YQJRCategory.h"
#import "UIColor+YQJRCategory.h"

@implementation UIView (YQJRCategory)

static NSMapTable *mapTableForUIViewYQJRCategory = nil;

- (void)setYqjr_x:(CGFloat)yqjr_x {
    CGRect rect = self.frame;
    rect.origin.x = yqjr_x;
    self.frame = rect;
}

- (CGFloat)yqjr_x {
    return self.frame.origin.x;
}

- (void)setYqjr_y:(CGFloat)yqjr_y {
    CGRect rect = self.frame;
    rect.origin.y = yqjr_y;
    self.frame = rect;
}

- (CGFloat)yqjr_y {
    return self.frame.origin.y;
}

- (void)setYqjr_width:(CGFloat)yqjr_width {
    CGRect rect = self.frame;
    rect.size.width = yqjr_width;
    self.frame = rect;
}

- (CGFloat)yqjr_width {
    return self.frame.size.width;
}

- (void)setYqjr_height:(CGFloat)yqjr_height {
    CGRect rect = self.frame;
    rect.size.height = yqjr_height;
    self.frame = rect;
}

- (CGFloat)yqjr_height {
    return self.frame.size.height;
}

- (void)setYqjr_origin:(CGPoint)yqjr_origin {
    CGRect rect = self.frame;
    rect.origin = yqjr_origin;
    self.frame = rect;
}

- (CGPoint)yqjr_origin {
    return self.frame.origin;
}

- (void)setYqjr_size:(CGSize)yqjr_size {
    CGRect rect = self.frame;
    rect.size = yqjr_size;
    self.frame = rect;
}

- (CGSize)yqjr_size {
    return self.frame.size;
}

- (void)yqjr_showTextTipsWithString:(NSString *)string {
    if (mapTableForUIViewYQJRCategory == nil) {
        mapTableForUIViewYQJRCategory = [NSMapTable weakToWeakObjectsMapTable];
    }
    
    if (![self isKindOfClass:[UIView class]]) return;
    if (![string isKindOfClass:[NSString class]]) return;
    
    //防止多次调用方法导致多次添加
    if ([mapTableForUIViewYQJRCategory objectForKey:self]) {
        UIView *view = [mapTableForUIViewYQJRCategory objectForKey:self];
        [view removeFromSuperview];
        [mapTableForUIViewYQJRCategory removeObjectForKey:self];
    };
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectZero];
    backgroundView.backgroundColor = [UIColor yqjr_colorWithHexString:@"#e6e6e6" alpha:0.7];
    backgroundView.layer.cornerRadius = 4;
    backgroundView.layer.masksToBounds = YES;
    
    [self addSubview:backgroundView];
    backgroundView.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *leftCon = [NSLayoutConstraint constraintWithItem:backgroundView attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationGreaterThanOrEqual toItem:self attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
    NSLayoutConstraint *rightCon = [NSLayoutConstraint constraintWithItem:backgroundView attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationLessThanOrEqual toItem:self attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    NSLayoutConstraint *centerXCon = [NSLayoutConstraint constraintWithItem:backgroundView attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *centerYCon = [NSLayoutConstraint constraintWithItem:backgroundView attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:self attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    [self addConstraints:@[leftCon,rightCon,centerXCon,centerYCon]];
    
    [mapTableForUIViewYQJRCategory setObject:backgroundView forKey:self];
    
    UILabel *tipsLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    tipsLabel.font = [UIFont systemFontOfSize:14];
    tipsLabel.textColor = [UIColor yqjr_colorWithHexString:@"#515151"];
    tipsLabel.text = string;
    tipsLabel.backgroundColor = [UIColor clearColor];
    tipsLabel.numberOfLines = 0;
    tipsLabel.textAlignment = NSTextAlignmentCenter;
    
    [backgroundView addSubview:tipsLabel];
    tipsLabel.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *tipsLeftCon = [NSLayoutConstraint constraintWithItem:tipsLabel attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:backgroundView attribute:NSLayoutAttributeLeft multiplier:1.0 constant:10];
    NSLayoutConstraint *tipsRightCon = [NSLayoutConstraint constraintWithItem:tipsLabel attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:backgroundView attribute:NSLayoutAttributeRight multiplier:1.0 constant:-10];
    NSLayoutConstraint *tipsCenterXCon = [NSLayoutConstraint constraintWithItem:tipsLabel attribute:NSLayoutAttributeCenterX relatedBy:NSLayoutRelationEqual toItem:backgroundView attribute:NSLayoutAttributeCenterX multiplier:1.0 constant:0];
    NSLayoutConstraint *tipsCenterYCon = [NSLayoutConstraint constraintWithItem:tipsLabel attribute:NSLayoutAttributeCenterY relatedBy:NSLayoutRelationEqual toItem:backgroundView attribute:NSLayoutAttributeCenterY multiplier:1.0 constant:0];
    NSLayoutConstraint *tipsTopCon = [NSLayoutConstraint constraintWithItem:tipsLabel attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:backgroundView attribute:NSLayoutAttributeTop multiplier:1.0 constant:10];
    NSLayoutConstraint *tipsBottomCon = [NSLayoutConstraint constraintWithItem:tipsLabel attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:backgroundView attribute:NSLayoutAttributeBottom multiplier:1.0 constant:-10];
    [backgroundView addConstraints:@[tipsLeftCon,tipsRightCon,tipsCenterXCon,tipsCenterYCon,tipsTopCon,tipsBottomCon]];
    
    __weak typeof(backgroundView) weakBackgroundView = backgroundView;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakBackgroundView removeFromSuperview];
    });
}

@end
