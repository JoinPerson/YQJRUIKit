//
//  WKWebView+YQJRCategory.m
//  YQJRUIKit
//
//  Created by wangzhen on 2020/5/28.
//

#import "WKWebView+YQJRCategory.h"

@implementation WKWebView (YQJRCategory)

#pragma mark - Public Method

- (void)yqjr_contentScreenshotCompletion:(void(^)(UIImage *image))completion {
    //制作一个UIView的副本
    UIView *snapShotView = [self snapshotViewAfterScreenUpdates:YES];
    
    snapShotView.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, snapShotView.frame.size.width, snapShotView.frame.size.height);
    
    [self.superview addSubview:snapShotView];
    
    //获取当前的内容偏移坐标
    CGPoint scrollOffset = self.scrollView.contentOffset;
    
    if (self.frame.size.height <= 0) {
        return;
    }
    //可滚动长度与UIView本身屏幕边界坐标相差倍数
    NSInteger maxPage = (NSInteger)ceilf(self.scrollView.contentSize.height / self.frame.size.height);
    
    //保持清晰度
    UIGraphicsBeginImageContextWithOptions(self.scrollView.contentSize, NO, [UIScreen mainScreen].scale);
    
    __weak typeof(self) weakSelf = self;
    __weak typeof(snapShotView) weakSnapShotView = snapShotView;
    [self yqjr_contentScrollingScreenshotCurrentPageIndex:0 maxPage:maxPage drawCallback:^{
        UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        [weakSelf.scrollView setContentOffset:scrollOffset animated:NO];
        [weakSnapShotView removeFromSuperview];
        
        //UIImage *resultImg = [UIImage imageWithData:UIImageJPEGRepresentation(capturedImage, 0.5)];
        
        if (completion) {
            completion(capturedImage);
        }
    }];
}

#pragma mark - Private Method

/// 滚动截图
/// @param currentPageIndex 当前页的索引
/// @param maxPage 最大页
/// @param drawCallback 画完后的回调
- (void)yqjr_contentScrollingScreenshotCurrentPageIndex:(NSInteger)currentPageIndex
                                                maxPage:(NSInteger)maxPage
                                           drawCallback:(void(^)(void))drawCallback {
    [self.scrollView setContentOffset:CGPointMake(0, currentPageIndex * self.frame.size.height)];
    CGRect splitFrame = CGRectMake(0, currentPageIndex * self.frame.size.height, self.frame.size.width, self.frame.size.height);
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf drawViewHierarchyInRect:splitFrame afterScreenUpdates:YES];
        if (currentPageIndex < maxPage) {
            [weakSelf yqjr_contentScrollingScreenshotCurrentPageIndex:currentPageIndex + 1 maxPage:maxPage drawCallback:drawCallback];
        } else {
            if (drawCallback != nil) {
                drawCallback();
            }
        }
    });
}

@end
