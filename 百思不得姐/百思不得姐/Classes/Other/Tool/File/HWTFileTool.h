//
//  HWTFileTool.h
//  百思不得姐
//
//  Created by hegaokun on 2017/5/3.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HWTFileTool : NSObject


/**
 删除文件夹

 @param directoryPath 文件夹路径
 */
+ (void)removeDirectoryPath:(NSString *)directoryPath;

/**
 获取文件夹的尺寸大小

 @param directoryPath 文件夹路径
 @param completion 回调
 */
+ (void)getFileSize:(NSString *)directoryPath completion:(void(^)(NSInteger))completion;

@end
