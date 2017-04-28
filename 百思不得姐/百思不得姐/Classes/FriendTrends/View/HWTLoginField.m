//
//  HWTLoginField.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/28.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTLoginField.h"

@implementation HWTLoginField

- (void)awakeFromNib {
    [super awakeFromNib];
    //点击文本框让 光标和文字 变白色
    self.tintColor = [UIColor whiteColor];
    //开始编辑
    [self addTarget:self action:@selector(textBegin) forControlEvents:UIControlEventEditingDidBegin];
    //结束编辑
    [self addTarget:self action:@selector(textEnd) forControlEvents:UIControlEventEditingDidEnd];
    //设置文本默认颜色
    [self setupAttributeWithColor:[UIColor lightGrayColor]];
}

#pragma mark - 事件
//开始编辑调用
- (void)textBegin {
    [self setupAttributeWithColor:[UIColor whiteColor]];
}

//结束编辑调用
- (void)textEnd {
    [self setupAttributeWithColor:[UIColor lightGrayColor]];
}

- (void)setupAttributeWithColor:(UIColor *)color {
    NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
    attributes[NSForegroundColorAttributeName] = color;
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:attributes];
}

@end
