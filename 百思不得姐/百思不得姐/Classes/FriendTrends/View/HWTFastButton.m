//
//  HWTFastButton.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/27.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTFastButton.h"

@implementation HWTFastButton

- (void)layoutSubviews {
    [super layoutSubviews];
    //设置图片位置
    self.imageView.hwt_y = 0;
    self.imageView.hwt_centerX = self.hwt_width * 0.5;
    //设置标题位置
    self.titleLabel.hwt_y = self.hwt_height - self.titleLabel.hwt_height;
    [self.titleLabel sizeToFit];
    self.titleLabel.hwt_centerX = self.hwt_width * 0.5;
}

@end
