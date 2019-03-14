//
//  IdolTvHttpCallbackDelegate.h
//  IdolTv
//
//  Created by 张 真 on 16/4/13.
//  Copyright © 2016年 张 真. All rights reserved.
//

@protocol IdolTvHttpCallbackDelegate

/**
 *  @author LionelZhang
 *
 *  @brief http回调方法
 *
 *  @param protoclId 协议号
 *  @param status 当前状态
 *  @param data   返回数据(dictionary)
 */
-(void) httpCallbackWithProtocolIdAndDicData:(int)protoclId httpCallbackStatus:(int)status httpCallbackData:(NSDictionary *) data;

/**
 *  @author LionelZhang
 *
 *  @brief http回调方法
 *
 *  @param protoclId 协议号
 *  @param status    状态
 *  @param data      返回数据(string)
 */
-(void) httpcallbackWithProtocolIdAndStringData:(int)protoclId httpCallbackStatus:(int)status httpCallbackData:(NSString *) data;

@end
