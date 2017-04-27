//
//  HWTLoginRegisterController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/26.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTLoginRegisterController.h"
#import "HWTLoginRegisterView.h"
#import "HWTFastLoginView.h"

@interface HWTLoginRegisterController ()

@property (weak, nonatomic) IBOutlet UIView *middleView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leadCons;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation HWTLoginRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    //添加中间登录的 view
    HWTLoginRegisterView *loginView = [HWTLoginRegisterView loginView];
    loginView.frame = CGRectMake(0, 0, self.middleView.hwt_width * 0.5, self.middleView.hwt_height);
    [self.middleView addSubview:loginView];
    //添加中间注册的 view
    HWTLoginRegisterView *registerView = [HWTLoginRegisterView registerView];
    registerView.frame = CGRectMake(self.middleView.hwt_width * 0.5, 0, self.middleView.hwt_width * 0.5, self.middleView.hwt_height);
    [self.middleView addSubview:registerView];
    //添加底部的快速登录
    [self.bottomView addSubview:[HWTFastLoginView fastLoginView]];
}

#pragma mark - 事件
- (IBAction)close:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)registerClick:(UIButton *)sender {
    sender.selected = !sender.selected;
    //平移中间 View
    _leadCons.constant = _leadCons.constant == 0 ? -self.middleView.hwt_width : 0;
    [UIView animateWithDuration:0.3 animations:^{
        [self.view layoutIfNeeded];
    }];
}


@end
