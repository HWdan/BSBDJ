//
//  HWTAdViewController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/25.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTAdViewController.h"
#import "HWTAdModel.h"
#import "HWTTabBarController.h"

#define ADServiceHttp @"http://mobads.baidu.com/cpro/ui/mads.php"
#define code2 @"phcqnauGuHYkFMRquANhmgN_IauBThfqmgKsUARhIWdGULPxnz3vndtkQW08nau_I1Y1P1Rhmhwz5Hb8nBuL5HDknWRhTA_qmvqVQhGGUhI_py4MQhF1TvChmgKY5H6hmyPW5RFRHzuET1dGULnhuAN85HchUy7s5HDhIywGujY3P1n3mWb1PvDLnvF-Pyf4mHR4nyRvmWPBmhwBPjcLPyfsPHT3uWm4FMPLpHYkFh7sTA-b5yRzPj6sPvRdFhPdTWYsFMKzuykEmyfqnauGuAu95Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiu9mLfqHbD_H70hTv6qnHn1PauVmynqnjclnj0lnj0lnj0lnj0lnj0hThYqniuVujYkFhkC5HRvnB3dFh7spyfqnW0srj64nBu9TjYsFMub5HDhTZFEujdzTLK_mgPCFMP85Rnsnbfknbm1QHnkwW6VPjujnBdKfWD1QHnsnbRsnHwKfYwAwiuBnHfdnjD4rjnvPWYkFh7sTZu-TWY1QW68nBuWUHYdnHchIAYqPHDzFhqsmyPGIZbqniuYThuYTjd1uAVxnz3vnzu9IjYzFh6qP1RsFMws5y-fpAq8uHT_nBuYmycqnau1IjYkPjRsnHb3n1mvnHDkQWD4niuVmybqniu1uy3qwD-HQDFKHakHHNn_HR7fQ7uDQ7PcHzkHiR3_RYqNQD7jfzkPiRn_wdKHQDP5HikPfRb_fNc_NbwPQDdRHzkDiNchTvwW5HnvPj0zQWndnHRvnBsdPWb4ri3kPW0kPHmhmLnqPH6LP1ndm1-WPyDvnHKBrAw9nju9PHIhmH9WmH6zrjRhTv7_5iu85HDhTvd15HDhTLTqP1RsFh4ETjYYPW0sPzuVuyYqn1mYnjc8nWbvrjTdQjRvrHb4QWDvnjDdPBuk5yRzPj6sPvRdgvPsTBu_my4bTvP9TARqnam"

@interface HWTAdViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *LaunchImageView;
@property (weak, nonatomic) IBOutlet UIView *adContainView;
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn;
@property (weak, nonatomic) UIImageView *adImageView;
@property (weak, nonatomic) NSTimer *timer;
@property (nonatomic, strong) HWTAdModel *adModel;
@end

@implementation HWTAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self setupLaunchImageView];
    [self loadAdData];
    //创建定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}

#pragma mark - 请求网络数据
- (void)loadAdData {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    parameters[@"code2"] = code2;
    [manager GET:ADServiceHttp parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        HWTLog(@"HWTAdViewController_responseObject = %@",responseObject);
        NSDictionary *adDict = [responseObject[@"ad"] lastObject];
        _adModel
        
        = [HWTAdModel mj_objectWithKeyValues:adDict];
        //按比例缩放
        CGFloat h = HWTScreenW / _adModel.w * _adModel.h;
        self.adImageView.frame = CGRectMake(0, 0, HWTScreenW, h);
        //加载广告网页
        [self.adImageView sd_setImageWithURL:[NSURL URLWithString:_adModel.w_picurl]];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        HWTLog(@"HWTAdViewController_error = %@",error);
    }];
}

#pragma mark - 设置启动图片
- (void)setupLaunchImageView {
    if (HWTScreenH == 736) {
        self.LaunchImageView.image = [UIImage imageNamed:@"LaunchImage-800-Portrait-736h"];
    } else if (HWTScreenH == 667) {
        self.LaunchImageView.image = [UIImage imageNamed:@"LaunchImage-800-667h"];
    } else if (HWTScreenH == 568) {
        self.LaunchImageView.image = [UIImage imageNamed:@"LaunchImage-568h"];
    } else if (HWTScreenH == 480) {
        self.LaunchImageView.image = [UIImage imageNamed:@"LaunchImage"];
    }
}

#pragma mark - 事件
//跳转到广告页面
- (void)tapGestureClick {
    HWTFunc;
    NSURL *url = [NSURL URLWithString:_adModel.ori_curl];
    UIApplication *app = [UIApplication sharedApplication];
    if ([app canOpenURL:url]) {
        [app openURL:url];
    }
}

- (IBAction)jumpClick:(id)sender {
    [self setJumpAndInvalidate];
}

- (void)timeChange {
    static int i = 3;
    if (i == 0) {
        [self setJumpAndInvalidate];
    }
    i--;
    //设置跳转按钮文字
    [_jumpBtn setTitle:[NSString stringWithFormat:@"跳过(%d)",i] forState:UIControlStateNormal];
}

- (void)setJumpAndInvalidate {
    //销毁广告界面，进入主界面
    [UIApplication sharedApplication].keyWindow.rootViewController = [[HWTTabBarController alloc] init];
    //删除定时器
    [_timer invalidate];
}

#pragma mark - 懒加载
- (UIImageView *)adImageView {
    if (_adImageView == nil) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self.adContainView addSubview:imageView];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGestureClick)];
        [imageView addGestureRecognizer:tap];
        imageView.userInteractionEnabled = YES;
        _adImageView = imageView;
    }
    return _adImageView;
}

@end
