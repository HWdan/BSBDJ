//
//  HWTTitleButton.m
//  百思不得姐
//
//  Created by hegaokun on 2017/5/4.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTTitleButton.h"

@implementation HWTTitleButton

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        [self setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    }
    return self;
}
//重写这个方法，按钮就无法进入 highlighted 状态
- (void)setHighlighted:(BOOL)highlighted {
    
}

@end
