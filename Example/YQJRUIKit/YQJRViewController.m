//
//  YQJRViewController.m
//  YQJRUIKit
//
//  Created by JoinPerson on 09/16/2019.
//  Copyright (c) 2019 JoinPerson. All rights reserved.
//

#import "YQJRViewController.h"
#import <YQJRUIKit/UIColor+YQJRCategory.h>
#import <YQJRUIKit/UIView+YQJRCategory.h>

@interface YQJRViewController ()

@end

@implementation YQJRViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    self.view.backgroundColor = [UIColor yqjr_colorWithHexString:@"ff7700"];
    [self.view yqjr_showTextTipsWithString:@"成功"];
}

@end
