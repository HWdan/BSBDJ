//
//  HWTEssenceViewController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/19.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTEssenceViewController.h"

@interface HWTEssenceViewController ()

@end

@implementation HWTEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
    [self setEssenceNavigationItem];
}

- (void)setEssenceNavigationItem {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"nav_item_game_icon" heihImageName:@"nav_item_game_click_icon" target:self action:@selector(essence_leftBarButtonClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationButtonRandom" heihImageName:@"navigationButtonRandomClick" target:self action:@selector(essence_rightBarButtonClick)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

- (void)essence_leftBarButtonClick {
    HWTFunc;
}

- (void)essence_rightBarButtonClick {
    HWTFunc;
}

@end
