//
//  HWTFileTool.m
//  百思不得姐
//
//  Created by hegaokun on 2017/5/3.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTFileTool.h"

@implementation HWTFileTool

+ (void)removeDirectoryPath:(NSString *)directoryPath {
    [self raiseExceptionWithPath:directoryPath];
    NSFileManager *manager = [NSFileManager defaultManager];
    NSArray *subPaths = [manager contentsOfDirectoryAtPath:directoryPath error:nil];
    for (NSString *subPath in subPaths) {
        NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
        [manager removeItemAtPath:filePath error:nil];
    }

}

+ (void)getFileSize:(NSString *)directoryPath completion:(void(^)(NSInteger))completion{
    [self raiseExceptionWithPath:directoryPath];
    //文件管理者
    NSFileManager *manager = [NSFileManager defaultManager];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSArray *subPaths = [manager subpathsAtPath:directoryPath];
        NSInteger totalSize = 0;
        for (NSString *subPath in subPaths) {
            NSString *filePath = [directoryPath stringByAppendingPathComponent:subPath];
            //判断是否是文件夹
            BOOL isDirectory;
            BOOL isExist = [manager fileExistsAtPath:filePath isDirectory:&isDirectory];
            if (!isExist || isDirectory) {
                continue;
            }
            //判断是否是隐藏文件
            if ([filePath containsString:@".DS"]) {
                continue;
            }
            NSDictionary *attributes = [manager attributesOfItemAtPath:filePath error:nil];
            totalSize += [attributes fileSize];
        }
        //计算完成回调(在主线程更新)
        dispatch_sync(dispatch_get_main_queue(), ^{
            if (completion) {
                completion(totalSize);
            }
        });
    });
}

+ (void)raiseExceptionWithPath:(NSString *)path {
    NSFileManager *manager = [NSFileManager defaultManager];
    //判断是否是文件夹
    BOOL isDirectory;
    BOOL isExist = [manager fileExistsAtPath:path isDirectory:&isDirectory];
    if (!isExist || !isDirectory) {
        NSException *exception = [NSException exceptionWithName:@"FilePathError" reason:@"需要传入文件夹路径，并且存在的路径" userInfo:nil];
        [exception raise];
    }
}


@end
