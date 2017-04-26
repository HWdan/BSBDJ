//
//  UIBarButtonItem+HWTItem.h
//  百思不得姐
//
//  Created by hegaokun on 2017/4/21.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HWTItem)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName heihImageName:(NSString *)heihImageName target:(id)target action:(SEL)action;

+ (UIBarButtonItem *)backItemWithImageName:(NSString *)imageName heihImageName:(NSString *)heihImageName target:(id)target action:(SEL)action title:(NSString *)title;

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName selectImageName:(NSString *)selectImageName target:(id)target action:(SEL)action;

@end
