//
//  IdolTvHttpManager.h
//  IdolTv
//
//  Created by 张 真 on 16/4/13.
//  Copyright © 2016年 张 真. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import <CoreLocation/CoreLocation.h>
#import "IdolTvTypeConvertUtil.h"
#import "IdolTvHttpCallbackDelegate.h"



@interface IdolTvHttpManager : NSObject
{
    /**
     *  @author LionelZhang
     *
     *  @brief AFNetworking实例
     */
    AFHTTPSessionManager *_afnManager;
    /**
     *  @author LionelZhang
     *
     *  @brief 回调方法
     */
    id <IdolTvHttpCallbackDelegate> _callback;
}

/**
 请求回应的类型
 */
typedef enum
{
    CODE_SUCCESS = 0,
}IdolTvHttpRequestStatus;

/**
 *  @author LionelZhang
 *
 *  @brief 为callback提供setter/getter
 */
@property (nonatomic,retain) id<IdolTvHttpCallbackDelegate> callback;
@property (nonatomic,retain) AFHTTPSessionManager *afnManager;

/**
 初始化http请求器
 @return <#return value description#>
 */
-(void)initData;

/**
 下载文件
 
 @param url 地址
 */
- (void)beginDownloadFile:(NSString*)url;

/**
 获取版本号
 
 @param url 地址
 */
- (void)getVersion:(NSString *)url;

/**
 加载html页面

 @param url <#url description#>
 */
- (void)loadHtmlFile:(NSString *)url;
@end
