//
//  GuideDetailPageViewController.h
//  Epic7Guide
//
//  Created by 张真 on 2019/3/10.
//  Copyright © 2019 张真. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>
#import "GameDataInstance.h"

NS_ASSUME_NONNULL_BEGIN

@interface GuideDetailPageViewController : UIViewController
{
    WKWebView *wvHeroDetail;
}

@end

NS_ASSUME_NONNULL_END
