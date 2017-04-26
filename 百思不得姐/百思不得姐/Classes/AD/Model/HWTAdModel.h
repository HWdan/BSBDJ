//
//  HWTAdModel.h
//  百思不得姐
//
//  Created by hegaokun on 2017/4/25.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWTAdModel : NSObject
/** 广告地址 */
@property (nonatomic, strong) NSString *w_picurl;
/** 点击广告跳转地址 */
@property (nonatomic, strong) NSString *ori_curl;
/** 点击广告跳转地址 */
@property (nonatomic, assign) CGFloat w;
@property (nonatomic, assign) CGFloat h;


@end
