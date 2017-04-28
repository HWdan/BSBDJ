//
//  HWTFriendTrendsViewController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/19.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTFriendTrendsViewController.h"
#import "HWTLoginRegisterController.h"

@interface HWTFriendTrendsViewController ()

@end

@implementation HWTFriendTrendsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setFriendTrendsNavigationItem];
}

#pragma mark - 设置 Navigation
- (void)setFriendTrendsNavigationItem {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"friendsRecommentIcon" heihImageName:@"friendsRecommentIcon-click" target:self action:@selector(friendTrends_leftBarButtonClick)];
    
    self.navigationItem.title = @"我的关注";
}

#pragma mark - 事件
- (void)friendTrends_leftBarButtonClick {
    HWTFunc;
}
- (IBAction)loginRegisterClick:(id)sender {
    HWTLoginRegisterController *loginRegisterVC = [[HWTLoginRegisterController alloc] init];
    [self presentViewController:loginRegisterVC animated:YES completion:nil];
}

@end
