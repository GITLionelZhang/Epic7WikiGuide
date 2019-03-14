//
//  IdolTvTimeStampUtil.m
//  IdolTv
//
//  Created by 张 真 on 16/4/14.
//  Copyright © 2016年 张 真. All rights reserved.
//

#import "IdolTvTimeStampUtil.h"

@implementation IdolTvTimeStampUtil

/**
 *  @author LionelZhang
 *
 *  @brief 获取当前时间戳
 *
 *  @return <#return value description#>
 */
+ (long)GetTimeStampWithNow
{
    NSDate *date = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval nowDate = [date timeIntervalSince1970];
    return nowDate;
}
@end
