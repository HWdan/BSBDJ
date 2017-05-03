//
//  HWTSettingViewController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/24.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTSettingViewController.h"
#import "HWTFileTool.h"

static NSString * const setting_cellID = @"setting_cellID";
#define cachePath [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject]

@interface HWTSettingViewController ()
@property (nonatomic, assign) NSInteger totalSize;
@end

@implementation HWTSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:setting_cellID];
    [SVProgressHUD showWithStatus:@"正在计算缓存..."];
    //计算文件夹尺寸大小
    [HWTFileTool getFileSize:cachePath completion:^(NSInteger totalSize) {
        _totalSize = totalSize;
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    }];
}

#pragma mark - 导航栏左边返回按钮
- (void)setupNavigationBar {
        self.navigationItem.title = @"设置";
}


#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:setting_cellID forIndexPath:indexPath];
    cell.textLabel.text = [self sizeSting];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //清楚缓存
    [HWTFileTool removeDirectoryPath:cachePath];
    _totalSize = 0;
    [self.tableView reloadData];
}

- (NSString *)sizeSting {
    NSString *sizeSting = @"清除缓存";
    if (_totalSize > 1000.0 * 1000.0) {
        CGFloat size = _totalSize / 1000.0 / 1000.0;
        sizeSting = [NSString stringWithFormat:@"%@(%.1fMB)",sizeSting,size];
    } else if (_totalSize > 1000.0) {
        CGFloat size = _totalSize / 1000.0 ;
        sizeSting = [NSString stringWithFormat:@"%@(%.1fKB)",sizeSting,size];
    } else if (_totalSize > 0) {
        sizeSting = [NSString stringWithFormat:@"%@(%ldB)",sizeSting,_totalSize];
    }
    return sizeSting;
}


@end
