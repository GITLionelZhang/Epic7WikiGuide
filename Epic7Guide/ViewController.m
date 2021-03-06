//
//  ViewController.m
//  GameWithMonsterList
//
//  Created by 张真 on 2017/9/8.
//  Copyright © 2017年 张真. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[GameDataInstance Instance]InitData];
    httpManager = [[IdolTvHttpManager alloc]init];
    httpManager.callback = self;
    [httpManager initData];
    
    guideList = [[NSMutableArray alloc]init];
    
    self.searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    self.searchBar.delegate = self;
    [self.view addSubview:self.searchBar];
    
    
    [httpManager loadHtmlFile:@"http://epic7.gamekee.com/content/unkind.html?menu_id=1882"];
//    [httpManager loadHtmlFile:@"http://epic7.gamekee.com/activity/index.html"];
    treeView = [[RATreeView alloc] initWithFrame:self.view.bounds];
    treeView.delegate = self;
    treeView.dataSource = self;
    treeView.treeHeaderView = self.searchBar;
    [self.view addSubview:treeView];
    
    UIRefreshControl *refreshControl = [UIRefreshControl new];
    [refreshControl addTarget:self action:@selector(refreshControlChanged:) forControlEvents:UIControlEventValueChanged];
    [treeView.scrollView addSubview:refreshControl];
    
    [treeView registerNib:[UINib nibWithNibName:NSStringFromClass([HeroTableViewCell class]) bundle:nil] forCellReuseIdentifier:NSStringFromClass([HeroTableViewCell class])];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)refreshControlChanged:(UIRefreshControl *)refreshControl
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [httpManager loadHtmlFile:@"http://epic7.gamekee.com/content/unkind.html?menu_id=1882"];
        [refreshControl endRefreshing];
    });
}

- (NSInteger)treeView:(RATreeView *)treeView numberOfChildrenOfItem:(id)item
{
    
    if (item == nil) {
        return [guideList count];
    }
    
    Epic7GuideItem *data = item;
    return [data.children count];
}

- (id)treeView:(RATreeView *)treeView child:(NSInteger)index ofItem:(id)item
{
    Epic7GuideItem *data = item;
    if (item == nil) {
        return [guideList objectAtIndex:index];
    }
    
    return data.children[index];
}

- (CGFloat)treeView:(RATreeView *)treeView heightForRowForItem:(id)item
{
    return 44;
}

- (UITableViewCell *)treeView:(RATreeView *)treeView cellForItem:(id)item
{
    Epic7GuideItem *dataObject = item;
    
    HeroTableViewCell *cell = [treeView dequeueReusableCellWithIdentifier:NSStringFromClass([HeroTableViewCell class])];
    [cell setDataWithName:dataObject.name AndImgUrl:dataObject.iconUrl AndId:dataObject.guideId AndLevel:dataObject.level AndChildrenCount:dataObject.children == nil ?0:((int)dataObject.children.count)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return cell;
}


/**
 检测网络权限
 
 @return 是否有权限 0 关闭 1 仅wifi 2 流量+wifi
 */
+ (int)checkNetWorkPermission
{
    CTCellularData *cellularData = [[CTCellularData alloc]init];
    CTCellularDataRestrictedState state = cellularData.restrictedState;
    return state;
}

-(void)showQuestList
{
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    HeroDetailViewController *receive = [storyboard instantiateViewControllerWithIdentifier:@"HeroDetailViewController"];
    //    [[GameDataInstance Instance] loadUrl] =url;
    receive.loadUrl = @"https://モンスターストライク.gamewith.jp/article/show/3054";
    [self.navigationController pushViewController:receive animated:YES];
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if([searchText isEqualToString:@""])
    {
        return;
    }
    Epic7GuideItem *resultItem;
    for( int i = 0 ; i < guideList.count ; i++)
    {
        resultItem = [self searchForItem:searchText AndItem:guideList[i]];
        if(resultItem != nil)
            break;
    }
    if(resultItem != nil)
    {
        NSMutableArray *itemList = [[NSMutableArray alloc]init];
        [itemList addObject:resultItem];
        Epic7GuideItem *rootItem = resultItem;
        while(rootItem.parent)
        {
            rootItem = rootItem.parent;
            [itemList addObject:rootItem];
        }
        for(int i = (int)(itemList.count -1) ;i >=0 ;i--)
        {
            [treeView expandRowForItem:itemList[i] expandChildren:NO withRowAnimation:RATreeViewRowAnimationTop];
        }
        [searchBar resignFirstResponder];
        [treeView scrollToRowForItem:resultItem atScrollPosition:RATreeViewScrollPositionTop animated:YES];
    }
    
}

- (Epic7GuideItem *)searchForItem:(NSString *)keyWord AndItem:(Epic7GuideItem*)item
{
    if(item.children != nil && item.children.count != 0)
    {
        Epic7GuideItem *resultItem;
        for( int i = 0 ; i < item.children.count ; i++)
        {
            resultItem = [self searchForItem:keyWord AndItem:item.children[i]];
            if(resultItem != nil)
                return resultItem;
        }
    }
    else
    {
        if([item.name containsString:keyWord])
            return item;
    }
    return nil;
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.searchBar resignFirstResponder];
}

- (void)httpCallbackWithProtocolIdAndDicData:(int)protoclId httpCallbackStatus:(int)status httpCallbackData:(NSDictionary *)data
{
    if(protoclId == 4)
    {
        if(status == -1)
        {
            FFToast *toast = [[FFToast alloc]initToastWithTitle:@"" message:@"加载失败" iconImage:[UIImage imageNamed:@"DefaultImage"]];
            toast.toastPosition = FFToastPositionDefault;
            toast.toastBackgroundColor = [UIColor grayColor];
            [toast show];
        }
        else
        {
            NSArray *tempArr = [data copy];
            guideList = [[NSMutableArray alloc]init];
            for(int i = 0 ;i < tempArr.count ; i++)
            {
                Epic7GuideItem *item = [self addItemToNodeWithSorData:tempArr[i] AndLevel:0];
                [guideList addObject:item];
            }
            [treeView reloadData];
            
            NSLog(@"");
        }
    }
}

- (Epic7GuideItem *)addItemToNodeWithSorData:(NSDictionary *)sorData AndLevel:(int)level
{
    Epic7GuideItem *item = [[Epic7GuideItem alloc]init];
    [item setName:[sorData objectForKey:@"name"]];
    [item setGuideId:[sorData objectForKey:@"id"]];
    [item setIconUrl:[sorData objectForKey:@"icon"] == nil ?@"": [sorData objectForKey:@"icon"] ];
    [item setModule:[sorData objectForKey:@"module"] == nil ?-1:[[sorData objectForKey:@"module"] intValue]];
    [item setLevel:level];
    NSArray *guideChildren = [sorData objectForKey:@"child_menu"];
    
    item.children = [[NSMutableArray alloc]init];
    for(int i = 0 ; i < guideChildren.count ; i++)
    {
        [item.children addObject:[self addItemToNodeWithSorData:guideChildren[i] AndLevel:level+1 ]];
        ((Epic7GuideItem *)item.children[i]).parent = item;
    }
    return item;
}

- (void)httpcallbackWithProtocolIdAndStringData:(int)protoclId httpCallbackStatus:(int)status httpCallbackData:(NSString *)data
{
}

- (void)treeView:(RATreeView *)treeView didExpandRowForItem:(id)item
{
    HeroTableViewCell *cell = (HeroTableViewCell *)[treeView cellForItem:item];
    [cell setTipIconStatus:1];
    NSLog(@"treeView expand:%@",item);
    
}

- (void)treeView:(RATreeView *)treeView didSelectRowForItem:(id)item
{
    Epic7GuideItem *data = (Epic7GuideItem *)item;
    HeroTableViewCell *cell = (HeroTableViewCell *)[treeView cellForItem:item];
    [cell setTipIconStatus:2];
    
    if(data.children == nil || data.children.count == 0)
    {
        NSString *url ;
        switch (data.module) {
            case 1:
            {
                url = [NSString stringWithFormat:@"http://epic7.gamekee.com/contentmoba/%@.html",data.guideId];
            }
                break;
            case 2:
            {
                url = [NSString stringWithFormat:@"http://epic7.gamekee.com/mobadetail/%@.html",data.guideId];
            }
                break;
                
                
            default:
            {
                url = [NSString stringWithFormat:@"http://epic7.gamekee.com/detail/%@.html",data.guideId];
            }
                break;
        }
        
        [[GameDataInstance Instance] setLoadUrl:url];
        
        [self performSegueWithIdentifier:@"directToDetailPage" sender:self];
    }
   NSLog(@"treeView select:%@",item);
}

- (void)treeView:(RATreeView *)treeView didCollapseRowForItem:(id)item
{
    NSLog(@"treeView Collapse:%@",item);
}


- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}


-(void)clickFavor:(UISwitch*)sw
{
    NSLog(@"");
}

/**
 点击了收藏

 @param userId <#userId description#>
 @param isFavor <#isFavor description#>
 */
-(void)clickFavorButto:(int)userId AndIsFavor:(BOOL)isFavor
{
    
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    favorList = [[NSMutableDictionary alloc]initWithDictionary:[userDef objectForKey:@"favorList"]];
    if(favorList == nil)
    {
        favorList = [[NSMutableDictionary alloc]init];
    }
    
    if(isFavor)
    {
        [favorList setObject:@"favor" forKey:[NSString stringWithFormat:@"%d",userId]];
    }
    else
    {
        [favorList removeObjectForKey:[NSString stringWithFormat:@"%d",userId]];
    }
    [userDef setObject:favorList forKey:@"favorList"];
    [userDef synchronize];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return[scan scanInt:&val] && [scan isAtEnd];
}


@end
