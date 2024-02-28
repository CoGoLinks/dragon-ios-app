//
//  WebViewController.m
//  dragon-ios-app
//
//  Created by fangyp on 2023/12/13.
//

#import "WebViewController.h"

@interface WebViewController ()<WKScriptMessageHandler,WKUIDelegate>

@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //创建网页配置对象
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    WKUserContentController *userContentController = [[WKUserContentController alloc] init];
    [userContentController addScriptMessageHandler:self name:@"postMessageHandler"]; // 设置消息处理器名称
    configuration.userContentController = userContentController;
    
    CGFloat navigationBarHeight = self.navigationController.navigationBar.frame.size.height;
    CGFloat x = 0;
    CGFloat width = CGRectGetWidth(self.view.frame);
    CGFloat height = CGRectGetHeight(self.view.frame) - navigationBarHeight;
    CGRect frame = CGRectMake(x, navigationBarHeight, width, height);
    
    self.wkWebView = [[WKWebView alloc] initWithFrame:frame configuration:configuration];
    // 导航代理
    self.wkWebView.navigationDelegate = self;
    // UI代理
    self.wkWebView.UIDelegate = self;
    // 是否允许手势左滑返回上一级, 类似导航控制的左滑返回
    self.wkWebView.allowsBackForwardNavigationGestures = YES;

    [self.view addSubview:self.wkWebView];
    
    NSURL *url = [NSURL URLWithString:self.url];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.wkWebView loadRequest:request];
}

// 实现WKNavigationDelegate的方法
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"网页开始加载");
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation {
    NSLog(@"网页加载完成");
}

// 实现WKScriptMessageHandler协议方法
- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    NSLog(@"收到网页发送的消息：%@", message.body);
    // 判断消息名称
    if ([message.name isEqualToString:@"postMessageHandler"]) {
        // 处理收到的消息
        if([message.body isEqualToString:@"icts-h5-close"]) {
            [self.navigationController popToRootViewControllerAnimated:YES];
        }
    }
}
@end
