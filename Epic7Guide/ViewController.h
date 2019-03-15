//
//  ViewController.h
//  GameWithMonsterList
//
//  Created by 张真 on 2017/9/8.
//  Copyright © 2017年 张真. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking/AFNetworking.h>
#import "IdolTvHttpManager.h"
#import <SSZipArchive/SSZipArchive.h>
#import "UserData.h"
#import "HeroTableViewCell.h"
#import "HeroDetailViewController.h"
#import "GameDataInstance.h"
#import <CoreTelephony/CTCellularData.h>
#import "RATreeView.h"
#import "Epic7GuideItem.h"


#import <FFToast/FFToast.h>


@interface ViewController : UIViewController<
IdolTvHttpCallbackDelegate,
UISearchBarDelegate,
HeroTableViewCellDelegate,
RATreeViewDelegate,
RATreeViewDataSource
>
{
    IdolTvHttpManager *httpManager;
    
    NSMutableArray *guideList;
    
    BOOL isSearch;
    
    NSString *fileUrl;
    
    //收藏列表
    NSMutableDictionary *favorList;
    
    RATreeView *treeView;
}

@property (weak, nonatomic) IBOutlet UITableView *tvHeroInfo;
@property (strong, nonatomic) UISearchBar *searchBar;
@property (weak, nonatomic) IBOutlet UIButton *btnHitSkill;
@property (weak, nonatomic) IBOutlet UIButton *btnQuestList;
@property (weak, nonatomic) IBOutlet UIButton *btnFavorList;

@end

