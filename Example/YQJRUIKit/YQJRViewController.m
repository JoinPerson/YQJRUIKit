//
//  YQJRViewController.m
//  YQJRUIKit
//
//  Created by JoinPerson on 09/16/2019.
//  Copyright (c) 2019 JoinPerson. All rights reserved.
//

#import "YQJRViewController.h"
#import <YQJRUIKit/YQJRUIKit.h>
#import "YQJRCustomViewController.h"

@interface YQJRViewController ()

@end

@implementation YQJRViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    YQJRCustomViewController *customVC = [[YQJRCustomViewController alloc] init];
    [self.navigationController pushViewController:customVC animated:YES];
}

@end
