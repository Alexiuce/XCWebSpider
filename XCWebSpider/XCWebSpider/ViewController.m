//
//  ViewController.m
//  XCWebSpider
//
//  Created by alexiuce on 2020/4/23.
//  Copyright © 2020 alexiuce. All rights reserved.
//


#import <WebKit/WebKit.h>
#import "MBProgressHUD.h"
#import "ViewController.h"


@interface ViewController ()<WKNavigationDelegate>

@property (weak) IBOutlet NSTextField *targetUrlTfd;

@property (strong, nonatomic) MBProgressHUD *hud;

@property (weak) IBOutlet WKWebView *testWebView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _hud = [[MBProgressHUD alloc]initWithView:self.view];
    self.hud.removeFromSuperViewOnHide = YES;
    
    self.view.layer.backgroundColor = [NSColor colorNamed:@"bgColor"].CGColor;
    
    self.testWebView.navigationDelegate = self;
}

- (IBAction)clickedStartBtn:(NSButton *)sender {
    NSString *targetUrl = self.targetUrlTfd.stringValue;
    self.hud.mode = MBProgressHUDModeText;
    self.hud.yOffset = 150;
    if (targetUrl.length == 0) {
        self.hud.labelText = @"地址不能为空";
        [self.view addSubview:self.hud];
        [self.hud show:YES];
        [self.hud hide:YES afterDelay:1.25];
        return;
    }
    if ([targetUrl hasPrefix:@"http://"] || [targetUrl hasPrefix:@"https://"]) {
        [self.view addSubview:self.hud];
        self.hud.yOffset = 0;
        self.hud.mode = MBProgressHUDModeIndeterminate;
        self.hud.labelText = @"数据处理中~";
        [self.hud show:YES];
        NSURL *url = [NSURL URLWithString:targetUrl];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [self.testWebView loadRequest:request];
    }

    
}

#pragma mark - WKNavigationDelegate


- (void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    
    [self.view addSubview:self.hud];
    self.hud.labelText = @"网页加载错误~";
    [self.hud show:YES];
    [self.hud hide:YES afterDelay:1.25];
}
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    
    [self.hud hide:YES afterDelay:2];
    NSString *jsCode = @"document.getElementsByTagName('HTML')[0].innerHTML";
    [self.testWebView evaluateJavaScript:jsCode completionHandler:^(NSString *html, NSError * error) {
        NSLog(@"%@",html);
    }];
    
}


- (void)saveHtml:(NSString *)html{
    
    /** html */
    
    /** css */
    /** js */
    /** image */
    
    
    
}




@end
