//
//  HWTNewViewController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/19.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTNewViewController.h"
#import "HWTSubTagViewController.h"

@interface HWTNewViewController ()

@end

@implementation HWTNewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
    [self setNewNavigationItem];
}

- (void)setNewNavigationItem {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"MainTagSubIcon" heihImageName:@"MainTagSubIconClick" target:self action:@selector(new_leftBarButtonClick)];
   
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

- (void)new_leftBarButtonClick {
    HWTFunc;
    HWTSubTagViewController *subTag = [[HWTSubTagViewController alloc] init];
    [self.navigationController pushViewController:subTag animated:YES];
}


@end
