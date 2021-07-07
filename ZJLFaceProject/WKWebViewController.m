//
//  WKWebViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2020/5/20.
//  Copyright © 2020 zjlzjl. All rights reserved.
//

#import "WKWebViewController.h"
#import <WebKit/WebKit.h>
@interface WKWebViewController () <WKUIDelegate,WKNavigationDelegate>
@property (strong, nonatomic) WKWebView *contentWebView;
@property (strong, nonatomic) NSURL *url;
@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WKWebViewConfiguration *config = [[WKWebViewConfiguration alloc] init];
    _contentWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, ScreenWidth, ScreenHeight - 88) configuration:config];
    _contentWebView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_contentWebView];
    _contentWebView.UIDelegate = self;
    _contentWebView.navigationDelegate = self;
    _url = [[NSBundle mainBundle] URLForResource:@"index.html" withExtension:nil];
    [_contentWebView loadFileURL:_url allowingReadAccessToURL:[NSURL fileURLWithPath:[NSBundle mainBundle].bundlePath]];
}

#pragma mark - UIWebViewDelegate
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    
}

- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    
}
    // 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    
}

@end
