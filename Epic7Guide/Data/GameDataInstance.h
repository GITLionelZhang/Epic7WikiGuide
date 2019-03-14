//
//  GameDataInstance.h
//  IdolTv
//
//  Created by 张 真 on 16/4/14.
//  Copyright © 2016年 张 真. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserData.h"


@interface GameDataInstance : NSObject
{
    NSMutableArray *_heroListData;
    
    NSMutableDictionary *_imageDict;
    
    NSMutableDictionary *_favorList;
    
}

/**
 *  @author LionelZhang
 *
 *  @brief 用户数据
 */
@property (nonatomic,retain)UserData *heroData;

@property (nonatomic,retain)NSMutableDictionary *imageDict;

@property (nonatomic,retain)NSMutableDictionary *favorList;

@property (nonatomic,retain)NSString *loadUrl;

/**
 *  @author LionelZhang
 *
 *  @brief 获取实例
 *
 *  @return <#return value description#>
 */
+ (id)Instance;

/**
 *  @author LionelZhang
 *
 *  @brief 初始化数据
 */
- (void)InitData;


@end
