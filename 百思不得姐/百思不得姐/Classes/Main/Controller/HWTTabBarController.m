//
//  HWTTabBarController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/19.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTTabBarController.h"
#import "HWTEssenceViewController.h"
#import "HWTFriendTrendsViewController.h"
#import "HWTPublishViewController.h"
#import "HWTNewViewController.h"
#import "HWTMeViewController.h"
#import "HWTTabBar.h"
#import "HWTNavigationController.h"

@interface HWTTabBarController ()

@end

@implementation HWTTabBarController
#pragma mark - 系统生命周期
+ (void)load {
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    //让选中的文字颜色改变
    NSMutableDictionary *mDict = [NSMutableDictionary dictionary];
    mDict[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:mDict forState:UIControlStateSelected];
    //设置字体大小：只有设置正常状态下才有效果（normal）
    NSMutableDictionary *mDictNor = [NSMutableDictionary dictionary];
    mDictNor[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:mDictNor forState:UIControlStateNormal];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAllChildViewController];
    [self setupAllTitleButton];
    [self setupTabBar];
}

#pragma mark - 设置 Navigation ChildViewController
- (void)setupAllChildViewController {
    [self setupChildViewControllerWithViewController:@"HWTEssenceViewController"];
    [self setupChildViewControllerWithViewController:@"HWTNewViewController"];
    [self setupChildViewControllerWithViewController:@"HWTFriendTrendsViewController"];
    [self setupChildViewControllerWithViewController:@"HWTMeViewController"];
}

- (void)setupChildViewControllerWithViewController:(NSString *)viewController {
    UIViewController *VC;
    if ([viewController isEqualToString:@"HWTMeViewController"]) {
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:viewController bundle:nil];
        VC = [storyboard instantiateInitialViewController];
    } else {
        VC = [[NSClassFromString(viewController) alloc] init];
    }
    HWTNavigationController *nav = [[HWTNavigationController alloc] initWithRootViewController:VC];
    [self addChildViewController:nav];
}

#pragma mark - 设置 TabBarItem
- (void)setupAllTitleButton {
    [self setupTabBarItemTitle:@"精华" image:@"tabBar_essence_icon" selectedImage:@"tabBar_essence_click_icon" childViewControllersIndex:0];
    [self setupTabBarItemTitle:@"新帖" image:@"tabBar_new_icon" selectedImage:@"tabBar_new_click_icon" childViewControllersIndex:1];
    [self setupTabBarItemTitle:@"关注" image:@"tabBar_friendTrends_icon" selectedImage:@"tabBar_friendTrends_click_icon" childViewControllersIndex:2];
    [self setupTabBarItemTitle:@"我" image:@"tabBar_me_icon" selectedImage:@"tabBar_me_click_icon" childViewControllersIndex:3];
}

- (void)setupTabBarItemTitle:(NSString *)title image:(NSString *)imageString selectedImage:(NSString *)selectedImageName childViewControllersIndex:(int)index {
    HWTNavigationController *nav = self.childViewControllers[index];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [UIImage imageNamed:imageString];
    //用代码实现选中图片：快速生成一个没有渲染的图片
    nav.tabBarItem.selectedImage = [UIImage imageOriginalWithName:selectedImageName];
}

#pragma mark - 自定义tabBar
- (void)setupTabBar {
    HWTTabBar *tabBar = [[HWTTabBar alloc] init];
    [self setValue:tabBar forKeyPath:@"tabBar"];
}

@end
