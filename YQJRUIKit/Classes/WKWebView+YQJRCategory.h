//
//  WKWebView+YQJRCategory.h
//  YQJRUIKit
//
//  Created by wangzhen on 2020/5/28.
//

#import <WebKit/WebKit.h>

@interface WKWebView (YQJRCategory)

/// 内容截屏
/// @param completion 回调
- (void)yqjr_contentScreenshotCompletion:(void(^)(UIImage *image))completion;

@end
