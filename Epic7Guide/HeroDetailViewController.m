//
//  HeroDetailViewController.m
//  GameWithMonsterList
//
//  Created by 张真 on 2017/9/13.
//  Copyright © 2017年 张真. All rights reserved.
//

#import "HeroDetailViewController.h"

@interface HeroDetailViewController ()

@end

@implementation HeroDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化webview配置
    WKWebViewConfiguration *configue = [[WKWebViewConfiguration alloc] init];
    configue.userContentController = [[WKUserContentController alloc]init];

    
    wvHeroDetail = [[WKWebView alloc]initWithFrame:self.view.frame configuration:configue];
    //设置webview禁止下拉
    wvHeroDetail.scrollView.bounces = NO;
    [self.view addSubview:wvHeroDetail];
    
    NSURLRequest *pageUrl = [NSURLRequest requestWithURL:[NSURL URLWithString:[self.loadUrl stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]]];
    
    [wvHeroDetail loadRequest:pageUrl];
    
    [wvHeroDetail setAllowsBackForwardNavigationGestures:true];
    [wvHeroDetail addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:0 context:nil];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    
}

@end
