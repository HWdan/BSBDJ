//
//  HWTNavigationController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/24.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTNavigationController.h"

@interface HWTNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation HWTNavigationController

+ (void)load {
    UINavigationBar *navBar = [UINavigationBar appearanceWhenContainedIn:self, nil];
    //设置标题大小
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSFontAttributeName] =[UIFont systemFontOfSize:20];
    [navBar setTitleTextAttributes:attrs];
    //设置导航条背景图片
    [navBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self.interactivePopGestureRecognizer.delegate action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:panGesture];
    panGesture.delegate = self;
    self.interactivePopGestureRecognizer.enabled = NO;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    return self.childViewControllers.count > 1;
}

#pragma mark - 重写 push 方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //非根控制器添加 “返回” 按钮
    if (self.childViewControllers.count > 0) {
        //跳转之前隐藏底部标签栏 Tarbar
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem backItemWithImageName:@"navigationButtonReturn" heihImageName:@"navigationButtonReturnClick" target:self action:@selector(backClick) title:@"返回"];
    }
    [super pushViewController:viewController animated:YES];
}

#pragma mark - 事件
- (void)backClick {
    [self popViewControllerAnimated:YES];
}


@end
