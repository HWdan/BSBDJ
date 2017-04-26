//
//  BSBDJ.h
//  百思不得姐
//
//  Created by hegaokun on 2017/4/21.
//  Copyright © 2017年 AAS. All rights reserved.
//

#ifdef DEBUG
#define HWTLog(...) NSLog(__VA_ARGS__)
#else
#define HWTLog(...)
#endif

#ifdef DEBUG
#define HWTFunc HWTLog(@"%s",__func__)
#else
#define HWTFunc
#endif

#define HWTScreenW [UIScreen mainScreen].bounds.size.width
#define HWTScreenH [UIScreen mainScreen].bounds.size.height

#import "UIBarButtonItem+HWTItem.h"
#import "UIImage+Image.h"
#import "AFNetworking.h"
#import "MJExtension.h"
#import <UIImageView+WebCache.h>
