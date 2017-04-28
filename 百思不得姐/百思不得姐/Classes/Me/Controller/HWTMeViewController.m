//
//  HWTMeViewController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/19.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTMeViewController.h"
#import "HWTSettingViewController.h"
#import "HWTSquareModel.h"
#import "HWTSquareCell.h"

#define Me_ServiceHttp @"http://api.budejie.com/api/api_open.php"
#define itemWH (HWTScreenW - (cols - 1) * margin) / cols
static NSInteger cols = 4;
static CGFloat margin = 1;
static NSString * const Me_CollectionViewCellID = @"Me_CollectionViewCellID";

@interface HWTMeViewController ()<UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray *squareModels;
@property (nonatomic, weak) UICollectionView *collectionView;

@end

@implementation HWTMeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMeTrendsNavigationItem];
    [self setupFooterView];
    [self loadData];
}

#pragma mark - 请求网络数据
- (void)loadData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"a"] = @"square";
    parameters[@"c"] = @"topic";
    [manager GET:Me_ServiceHttp parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        HWTLog(@"HWTMeViewController_responseObject = %@",responseObject);
        NSDictionary *responseDict = (NSDictionary *)responseObject;
        NSArray *dictArr = responseDict[@"square_list"];
        _squareModels = [HWTSquareModel mj_objectArrayWithKeyValuesArray:dictArr];
        [self resolveData];
        //设置 collectionView 的高度
        NSInteger rows = (_squareModels.count -1) / cols + 1;
        self.collectionView.hwt_height = rows * itemWH;
        //设置 tableview 的滚动范围（tableview 自己计算）
        self.tableView.tableFooterView = self.collectionView;
        [self.collectionView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        HWTLog(@"HWTMeViewController_error = %@",error);
    }];
}

#pragma mark - 处理请求的数据
- (void)resolveData {
    NSInteger exter = self.squareModels.count % cols;
    if (exter) {
        exter = cols - exter;
        for (int i = 0; i < exter; i++) {
            HWTSquareModel *square = [[HWTSquareModel alloc] init];
            [self.squareModels addObject:square];
        }
    }
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

#pragma mark - 设置 FooterView
- (void)setupFooterView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(itemWH, itemWH);
    layout.minimumInteritemSpacing = margin;
    layout.minimumLineSpacing = margin;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 0, 300) collectionViewLayout:layout];
    _collectionView = collectionView;
    collectionView.backgroundColor = self.tableView.backgroundColor;
    self.tableView.tableFooterView = collectionView;
    collectionView.dataSource = self;
    collectionView.scrollEnabled = NO;
    //注册 cell
    [collectionView registerNib:[UINib nibWithNibName:@"HWTSquareCell" bundle:nil] forCellWithReuseIdentifier:Me_CollectionViewCellID];
}

#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.squareModels.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HWTSquareCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Me_CollectionViewCellID forIndexPath:indexPath];
    cell.square = self.squareModels[indexPath.row];
    return cell;
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


@end
