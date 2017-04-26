//
//  HWTSubTagViewController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/25.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTSubTagViewController.h"
#import "HWTSubTagModel.h"
#import "HWTSubTagCell.h"

#define SubTagServiceHttp @"http://api.budejie.com/api/api_open.php"
static NSString * const subTagcellID = @"subTagcellID";
@interface HWTSubTagViewController ()

@property (nonatomic, strong) NSArray *subTags;

@end

@implementation HWTSubTagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadData];
    //注册 cell
    [self.tableView registerNib:[UINib nibWithNibName:@"HWTSubTagCell" bundle:nil] forCellReuseIdentifier:subTagcellID];
    self.title = @"推荐标签";
    //处理分割线：1.清空 tableView 的分割线内边距（iOS 7之后）2.清空 cell 的分割线内边距（iOS 8之后）
    self.tableView.separatorInset = UIEdgeInsetsZero;
}

#pragma mark - 请求网络数据
- (void)loadData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"tag_recommend";
    parameters[@"action"] = @"sub";
    parameters[@"c"] = @"topic";
    [manager GET:SubTagServiceHttp parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, NSArray * _Nullable responseObject) {
        HWTLog(@"HWTSubTagViewController_responseObject = %@",responseObject);
        _subTags = [HWTSubTagModel mj_objectArrayWithKeyValuesArray:responseObject];
        //刷新表格
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        HWTLog(@"HWTSubTagViewController_error = %@",error);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.subTags.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    HWTSubTagCell *cell = [tableView dequeueReusableCellWithIdentifier:subTagcellID];
    HWTSubTagModel *subTag = self.subTags[indexPath.row];
    cell.subTag = subTag;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
}

@end
