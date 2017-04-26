//
//  HWTMeViewController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/19.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTMeViewController.h"
#import "HWTSettingViewController.h"

@interface HWTMeViewController ()

@end

@implementation HWTMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255) / 255.0 green:arc4random_uniform(255) / 255.0 blue:arc4random_uniform(255) / 255.0 alpha:1];
    [self setMeTrendsNavigationItem];
}

#pragma mark - 设置导航栏
- (void)setMeTrendsNavigationItem {
    //设置
    UIBarButtonItem *settingItem = [UIBarButtonItem itemWithImageName:@"mine-setting-icon" heihImageName:@"mine-setting-icon-click" target:self action:@selector(me_settingItemBarButtonClick)];
    //夜间模式
    UIBarButtonItem *nightItem = [UIBarButtonItem itemWithImageName:@"mine-moon-icon" selectImageName:@"mine-moon-icon-click" target:self action:@selector(me_nightItemBarButtonClick:)];
    self.navigationItem.rightBarButtonItems = @[settingItem,nightItem];
    
    self.navigationItem.title = @"我的";
}

#pragma mark - 事件
- (void)me_settingItemBarButtonClick {
    HWTFunc;
    HWTSettingViewController *setting = [[HWTSettingViewController alloc] init];
    [self.navigationController pushViewController:setting animated:YES];
}

- (void)me_nightItemBarButtonClick:(UIButton *)button {
    HWTFunc;
    button.selected = !button.selected;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
