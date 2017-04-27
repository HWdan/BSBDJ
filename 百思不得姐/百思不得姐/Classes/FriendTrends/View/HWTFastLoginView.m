//
//  HWTFastLoginView.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/27.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTFastLoginView.h"

@implementation HWTFastLoginView

+ (instancetype)fastLoginView {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] firstObject];
}

@end
