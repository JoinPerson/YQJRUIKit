//
//  YQJRCustomViewController.m
//  YQJRUIKit_Example
//
//  Created by wangzhen on 2019/11/11.
//  Copyright © 2019 JoinPerson. All rights reserved.
//

#import "YQJRCustomViewController.h"
#import <YQJRUIKit/YQJRUIKit.h>

@interface YQJRCustomViewController ()

@end

@implementation YQJRCustomViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view yqjr_showTextTipsWithString:@"报错了！"];
    
    [UIActivityIndicatorView yqjr_loadingWithSuperview:self.view indicatorColor:[UIColor redColor] maskViewColor:[UIColor clearColor] offsetCenterY:0];
}

- (void)dealloc {
    NSLog(@"%@,%s",self,__func__);
}

@end
