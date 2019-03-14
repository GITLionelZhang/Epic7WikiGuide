//
//  GuideDetailPageViewController.m
//  Epic7Guide
//
//  Created by 张真 on 2019/3/10.
//  Copyright © 2019 张真. All rights reserved.
//

#import "GuideDetailPageViewController.h"

@interface GuideDetailPageViewController ()

@end

@implementation GuideDetailPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化webview配置
    WKWebViewConfiguration *configue = [[WKWebViewConfiguration alloc] init];
    configue.userContentController = [[WKUserContentController alloc]init];
    
    
    wvHeroDetail = [[WKWebView alloc]initWithFrame:self.view.frame configuration:configue];
    //设置webview禁止下拉
    wvHeroDetail.scrollView.bounces = NO;
    [self.view addSubview:wvHeroDetail];
    
    NSString *loadUrl = [[GameDataInstance Instance] loadUrl];
    
    NSURLRequest *pageUrl = [NSURLRequest requestWithURL:[NSURL URLWithString:[loadUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    [wvHeroDetail loadRequest:pageUrl];
    
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
