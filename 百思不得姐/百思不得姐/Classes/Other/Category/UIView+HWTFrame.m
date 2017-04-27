//
//  UIView+HWTFrame.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/27.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "UIView+HWTFrame.h"

@implementation UIView (HWTFrame)

- (void)setHwt_height:(CGFloat)hwt_height
{
    CGRect rect = self.frame;
    rect.size.height = hwt_height;
    self.frame = rect;
}

- (CGFloat)hwt_height
{
    return self.frame.size.height;
}

- (CGFloat)hwt_width
{
    return self.frame.size.width;
}
- (void)setHwt_width:(CGFloat)hwt_width
{
    CGRect rect = self.frame;
    rect.size.width = hwt_width;
    self.frame = rect;
}

- (CGFloat)hwt_x
{
    return self.frame.origin.x;
    
}

- (void)setHwt_x:(CGFloat)hwt_x
{
    CGRect rect = self.frame;
    rect.origin.x = hwt_x;
    self.frame = rect;
}

- (void)setHwt_y:(CGFloat)hwt_y
{
    CGRect rect = self.frame;
    rect.origin.y = hwt_y;
    self.frame = rect;
}

- (CGFloat)hwt_y
{
    
    return self.frame.origin.y;
}

- (void)setHwt_centerX:(CGFloat)hwt_centerX
{
    CGPoint center = self.center;
    center.x = hwt_centerX;
    self.center = center;
}

- (CGFloat)hwt_centerX
{
    return self.center.x;
}

- (void)setHwt_centerY:(CGFloat)hwt_centerY
{
    CGPoint center = self.center;
    center.y = hwt_centerY;
    self.center = center;
}

- (CGFloat)hwt_centerY
{
    return self.center.y;
}


@end
