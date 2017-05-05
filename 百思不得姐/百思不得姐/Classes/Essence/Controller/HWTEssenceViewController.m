//
//  HWTEssenceViewController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/4/19.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTEssenceViewController.h"
#import "HWTTitleButton.h"
#import "HWTAllViewController.h"
#import "HWTVideoViewController.h"
#import "HWTVoiceViewController.h"
#import "HWTPictureViewController.h"
#import "HWTWordViewController.h"

@interface HWTEssenceViewController ()
@property (nonatomic, weak) UIView *titleView;
@property (nonatomic, weak) UIView *titleUnderline;
@property (nonatomic, weak) UIButton *oldBtn;
@property (nonatomic, weak) UIScrollView *scrollView;
@end

@implementation HWTEssenceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupAllChildVC];
    [self setEssenceNavigationItem];
    [self setupScrollView];
    [self setupTitleView];
}

#pragma mark - 初始化子控制器
- (void)setupAllChildVC {
    [self addChildViewController:[[HWTAllViewController alloc] init]];
    [self addChildViewController:[[HWTVideoViewController alloc] init]];
    [self addChildViewController:[[HWTVoiceViewController alloc] init]];
    [self addChildViewController:[[HWTPictureViewController alloc] init]];
    [self addChildViewController:[[HWTWordViewController alloc] init]];
}

#pragma mark - 设置 ScrollView
- (void)setupScrollView {
    //不允许自动修改内容
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.showsVerticalScrollIndicator = NO;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.pagingEnabled = YES;
    scrollView.backgroundColor = HWTRandomColor;
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    self.scrollView = scrollView;
    NSInteger count = self.childViewControllers.count;
    CGFloat scrollViewW = scrollView.hwt_width;
    CGFloat scrollViewH = scrollView.hwt_height;
    for (NSInteger i = 0; i < count; i++) {
        UIView *childView = self.childViewControllers[i].view;
        childView.frame = CGRectMake(i * scrollViewW, 0, scrollViewW, scrollViewH);
        [scrollView addSubview:childView];
    }
    scrollView.contentSize = CGSizeMake(count * scrollViewW, 0);
}

#pragma mark - 设置 TitleView
- (void)setupTitleView {
    UIView *titleView = [[UIView alloc] init];
    titleView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
    titleView.frame = CGRectMake(0, HWTNavMaxY, self.view.hwt_width, HWTTitleViewH);
    [self.view addSubview:titleView];
    self.titleView = titleView;
    //标题栏按钮
    [self setuptitleButton];
    //标题下划线
    [self setupTitleUnderline];
}

#pragma mark - 设置 titleButton
- (void)setuptitleButton {
    NSArray *titles = @[@"全部", @"视频", @"声音", @"图片", @"段子"];
    //按钮尺寸
    CGFloat titleButtonW = self.titleView.hwt_width / titles.count;
    CGFloat titleButtonH = self.titleView.hwt_height;
    for (NSInteger i = 0; i < titles.count; i++) {
        HWTTitleButton *titleButton = [[HWTTitleButton alloc] init];
        [titleButton addTarget:self action:@selector(titleButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleView addSubview:titleButton];
        titleButton.frame = CGRectMake(i * titleButtonW, 0, titleButtonW, titleButtonH);
        [titleButton setTitle:titles[i] forState:UIControlStateNormal];
    }
}

#pragma mark - 设置 TitleUnderline
- (void)setupTitleUnderline {
    HWTTitleButton *firstTitleButton = self.titleView.subviews.firstObject;
    UIView *titleUnderline = [[UIView alloc] init];
    titleUnderline.hwt_height = 2;
    titleUnderline.hwt_y = self.titleView.hwt_height - titleUnderline.hwt_height;
    titleUnderline.backgroundColor = [firstTitleButton titleColorForState:UIControlStateSelected];
    [self.titleView addSubview:titleUnderline];
    self.titleUnderline = titleUnderline;
    [firstTitleButton.titleLabel sizeToFit];
    firstTitleButton.selected = YES;
    self.oldBtn = firstTitleButton;
    self.titleUnderline.hwt_width = firstTitleButton.titleLabel.hwt_width + 10;
    self.titleUnderline.hwt_centerX = firstTitleButton.hwt_centerX;
}


#pragma mark - 设置 NavigationItem
- (void)setEssenceNavigationItem {
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImageName:@"nav_item_game_icon" heihImageName:@"nav_item_game_click_icon" target:self action:@selector(essence_leftBarButtonClick)];
    self.navigationItem.rightBarButtonItem = [UIBarButtonItem itemWithImageName:@"navigationButtonRandom" heihImageName:@"navigationButtonRandomClick" target:self action:@selector(essence_rightBarButtonClick)];
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
}

#pragma mark - 事件
- (void)titleButtonClick:(UIButton *)button {
    //切换按钮状态
    self.oldBtn.selected = NO;
    button.selected = YES;
    self.oldBtn = button;
    [UIView animateWithDuration:0.25 animations:^{
        //处理下划线
        self.titleUnderline.hwt_width = button.titleLabel.hwt_width + 10;
        self.titleUnderline.hwt_centerX = button.hwt_centerX;
        //滚动 scrollview
        NSInteger index = [self.titleView.subviews indexOfObject:button];
        CGFloat offsetX = self.scrollView.hwt_width * index;
        self.scrollView.contentOffset = CGPointMake(offsetX, self.scrollView.contentOffset.y);
    }];
}

- (void)essence_leftBarButtonClick {
    HWTFunc;
}

- (void)essence_rightBarButtonClick {
    HWTFunc;
}

@end
