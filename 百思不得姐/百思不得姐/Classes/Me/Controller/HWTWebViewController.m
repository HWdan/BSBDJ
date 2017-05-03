//
//  HWTWebViewController.m
//  百思不得姐
//
//  Created by hegaokun on 2017/5/2.
//  Copyright © 2017年 AAS. All rights reserved.
//

#import "HWTWebViewController.h"
#import <WebKit/WebKit.h>

@interface HWTWebViewController ()
@property (weak, nonatomic) IBOutlet UIProgressView *progressView;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *backItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *forwardItem;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) WKWebView *webView;
@end

@implementation HWTWebViewController

#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    //添加 WKWebView
    WKWebView *webView = [[WKWebView alloc] init];
    _webView = webView;
    [self.contentView addSubview:webView];
    //加载网页
    [webView loadRequest:[NSURLRequest requestWithURL:_url]];
    //用 KVO 监听属性改变 (注意：记得销毁)
    [webView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"canGoBack" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"canGoForward" options:NSKeyValueObservingOptionNew context:nil];
    [webView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
    
}

//只要 KVO 观察对象属性有新值就会调用
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    self.title = self.webView.title;
    self.backItem.enabled = self.webView.canGoBack;
    self.forwardItem.enabled = self.webView.canGoForward;
    self.progressView.progress = self.webView.estimatedProgress;
    self.progressView.hidden = self.webView.estimatedProgress >= 1;
}

//销毁
- (void)dealloc {
    [self.webView removeObserver:self forKeyPath:@"title"];
    [self.webView removeObserver:self forKeyPath:@"canGoBack"];
    [self.webView removeObserver:self forKeyPath:@"canGoForward"];
    [self.webView removeObserver:self forKeyPath:@"estimatedProgress"];
}

//布局 UI
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    _webView.frame = self.contentView.bounds;
}

#pragma mark - 事件
//后退
- (IBAction)goBack:(id)sender {
    [self.webView goBack];
}
//前进
- (IBAction)goForward:(id)sender {
    [self.webView goForward];
}
//刷新
- (IBAction)reload:(id)sender {
    [self.webView reload];
}

@end
