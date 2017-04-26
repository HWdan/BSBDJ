//
//  HWTFriendTrendsViewController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/19.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTFriendTrendsViewController.h"

@interface HWTFriendTrendsViewController ()

@end

@implementation HWTFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
    [self setFriendTrendsNavigationItem];
}

- (void)setFriendTrendsNavigationItem {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"friendsRecommentIcon" heihImageName:@"friendsRecommentIcon-click" target:self action:@selector(friendTrends_leftBarButtonClick)];
    
    self.navigationItem.title = @"我的关注";
}

- (void)friendTrends_leftBarButtonClick {
    HWTFunc;
}

@end
