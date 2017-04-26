//
//  HWTTabBar.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/21.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTTabBar.h"

@interface HWTTabBar ()

@property (nonatomic, weak) UIButton *publishButton;

@end


@implementation HWTTabBar

- (UIButton *)publishButton {
    if (_publishButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
        [btn sizeToFit];
        [self addSubview:btn];
        _publishButton = btn;
    }
    return _publishButton;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    //跳转 tabBarButton 位置
    CGFloat btnW = self.bounds.size.width / (self.items.count + 1);
    CGFloat btnH = self.bounds.size.height;
    CGFloat x = 0;
    int i = 0;
    // UITabBarButton 为系统的私有类
    for (UIView *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            if (i == 2) {
                i += 1;
            }
            x = i * btnW;
            tabBarButton.frame = CGRectMake(x, 0, btnW, btnH);
            i++;
        }
    }
    //调整发布按钮位置
    self.publishButton.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height * 0.5);
}

@end
