//
//  UIBarButtonItem+HWTItem.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/21.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "UIBarButtonItem+HWTItem.h"

@implementation UIBarButtonItem (HWTItem)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName heihImageName:(NSString *)heihImageName target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:heihImageName] forState:UIControlStateHighlighted];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}

+ (UIBarButtonItem *)backItemWithImageName:(NSString *)imageName heihImageName:(NSString *)heihImageName target:(id)target action:(SEL)action title:(NSString *)title {
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [backBtn setTitle:title forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [backBtn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [backBtn setImage:[UIImage imageNamed:heihImageName] forState:UIControlStateHighlighted];
    [backBtn sizeToFit];
    backBtn.contentEdgeInsets = UIEdgeInsetsMake(0, -20, 0, 0);
    [backBtn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName selectImageName:(NSString *)selectImageName target:(id)target action:(SEL)action {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:selectImageName] forState:UIControlStateSelected];
    [btn sizeToFit];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIView *view = [[UIView alloc] initWithFrame:btn.bounds];
    [view addSubview:btn];
    return [[UIBarButtonItem alloc] initWithCustomView:view];
}



@end
