//
//  HeroDetailViewController.h
//  GameWithMonsterList
//
//  Created by 张真 on 2017/9/13.
//  Copyright © 2017年 张真. All rights reserved.
//

#import <WebKit/WebKit.h>
#import "GameDataInstance.h"
#import <M13ProgressSuite/M13ProgressViewSegmentedRing.h>
#import <M13ProgressSuite/M13ProgressHUD.h>

@interface HeroDetailViewController : UIViewController
{
    WKWebView *wvHeroDetail;
    
//    M13ProgressHUD *progressBar;
    
}

@property (nonatomic,strong)NSString *loadUrl;

@end
