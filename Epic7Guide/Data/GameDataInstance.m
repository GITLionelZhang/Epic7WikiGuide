//
//  GameDataInstance.m
//  IdolTv
//
//  Created by 张 真 on 16/4/14.
//  Copyright © 2016年 张 真. All rights reserved.
//

#import "GameDataInstance.h"

@implementation GameDataInstance

@synthesize heroData = _heroData;
@synthesize imageDict = _imageDict;
@synthesize favorList = _favorList;
@synthesize loadUrl = _loadUrl;

/**
 *  @author LionelZhang
 *
 *  @brief 初始化实例
 *
 *  @return <#return value description#>
 */
+ (id)Instance
{
    static GameDataInstance *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc]init];
    });
    return instance;
}

/**
 *  @author LionelZhang
 *
 *  @brief 初始化数据
 */
- (void)InitData
{
    self.heroData = [[UserData alloc]init];
    
    self.imageDict = [[NSMutableDictionary alloc]init];
   
    self.favorList = [[NSMutableDictionary alloc]init];
}

@end
