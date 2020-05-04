//
//  UIView+YQJRCategory.h
//  Pods-YQJRUIKit_Example
//
//  Created by wangzhen on 2019/9/23.
//

#import <UIKit/UIKit.h>

@interface UIView (YQJRCategory)

@property(nonatomic, assign)CGFloat yqjr_x;
@property(nonatomic, assign)CGFloat yqjr_y;
@property(nonatomic, assign)CGFloat yqjr_width;
@property(nonatomic, assign)CGFloat yqjr_height;
@property(nonatomic, assign)CGPoint yqjr_origin;
@property(nonatomic, assign)CGSize yqjr_size;
@property(nonatomic, assign)CGFloat yqjr_centerX;
@property(nonatomic, assign)CGFloat yqjr_centerY;

@property(nonatomic, assign)CGFloat yqjr_cornerRadius;
@property(nonatomic, strong)UIColor *yqjr_borderColor;

/**
 显示文本提示(简单的tips提示，默认2秒后消失)
 
 @param string 要显示的文本
 */
- (void)yqjr_showTextTipsWithString:(NSString *)string;

/// 显示文本提示(简单的tips提示，默认2秒后消失)
/// @param string 要显示的文本
/// @param complete tips提示消失后的回调
- (void)yqjr_showTextTipsWithString:(NSString *)string
                           complete:(void(^)(void))complete;

@end
