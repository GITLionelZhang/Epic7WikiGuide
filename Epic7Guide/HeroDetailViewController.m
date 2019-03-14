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
    
//    progressBar = [[M13ProgressHUD alloc] initWithProgressView:[[M13ProgressViewSegmentedRing alloc] init]];
    
    CGRect rectStatus = [[UIApplication sharedApplication] statusBarFrame];
    CGRect rectNav = self.navigationController.navigationBar.frame;
    int width = self.view.frame.size.width * 0.1;
    int height = width;
    int x = (self.view.frame.size.width - width)/2;
    int y = (self.view.frame.size.height - height)/2 - rectNav.size.height - rectStatus.size.height;
//    [progressBar setMinimumSize: CGSizeMake(width, height)];
//    progressBar.progressViewSize = CGSizeMake(width, height);
//    progressBar.frame = CGRectMake(x, y,width, height);
    
    
//    [self.view addSubview:progressBar];
//    [progressBar show:YES];
    
    
    // Configure the progress view
//    progressBar.animationPoint = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, [UIScreen mainScreen].bounds.size.height / 2);
    
    NSURLRequest *pageUrl = [NSURLRequest requestWithURL:[NSURL URLWithString:[self.loadUrl stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]]];
    
//    wvHeroDetail loadRequest:[NSURLRequest alloc]ini
    [wvHeroDetail loadRequest:pageUrl];
    
    [wvHeroDetail setAllowsBackForwardNavigationGestures:true];
    [wvHeroDetail addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:0 context:nil];

    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)observeValueForKeyPath:(NSString *)keyPath
                     ofObject:(id)object
                       change:(NSDictionary<NSKeyValueChangeKey,id> *)change
                      context:(void *)context{
    
//    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))]
//        && object == wvHeroDetail) {
//        [progressBar setProgress:wvHeroDetail.estimatedProgress animated:YES];
//        if (wvHeroDetail.estimatedProgress >= 1.0f) {
//            [UIView animateWithDuration:0.3f
//                                  delay:0.3f
//                                options:UIViewAnimationOptionCurveEaseOut
//                             animations:^{
//                                 //初始化定位服务
//                                 [progressBar setAlpha:0.0f];
//                             }
//                             completion:^(BOOL finished) {
//                                 [progressBar setProgress:0.1f animated:YES];
//                             }];
//        }
//    }else{
//        [super observeValueForKeyPath:keyPath
//                             ofObject:object
//                               change:change
//                              context:context];
//    }
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
