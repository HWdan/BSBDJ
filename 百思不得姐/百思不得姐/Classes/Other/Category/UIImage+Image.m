//
//  UIImage+Image.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/20.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "UIImage+Image.h"

@implementation UIImage (Image)

+ (UIImage *)imageOriginalWithName:(NSString *)name {
    UIImage *image = [UIImage imageNamed:name];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    return image;
}

@end
