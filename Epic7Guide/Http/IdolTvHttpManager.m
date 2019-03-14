//
//  IdolTvHttpManager.m
//  IdolTv
//
//  Created by 张 真 on 16/4/13.
//  Copyright © 2016年 张 真. All rights reserved.
//

#import "IdolTvHttpManager.h"
#import "AFNetworking.h"

@interface IdolTvHttpManager()

/**
 *  @author LionelZhang
 *
 *  @brief 获取http的code
 *
 *  @return code
 */
- (int)getHttpCodeWithDicData:(NSDictionary *)sorData;

@end

@implementation IdolTvHttpManager
@synthesize afnManager = _afnManager;
@synthesize callback = _callback;


/**
 初始化http请求器
 @return <#return value description#>
 */
-(void)initData
{
    
        _afnManager = [AFHTTPSessionManager manager];
        _afnManager.securityPolicy.allowInvalidCertificates = YES;
        [_afnManager.securityPolicy setValidatesDomainName:NO];
        
        [_afnManager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"multipart/form-data",@"text/html",@"application/json", @"text/json", @"text/javascript",nil]];
        _afnManager.responseSerializer = [AFHTTPResponseSerializer serializer];

}

/**
  下载文件

 @param url 地址
 */
- (void)beginDownloadFile:(NSString*)url
{
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    NSURLCache *cache = [NSURLCache sharedURLCache];
    [cache removeAllCachedResponses];
    
    NSURLSessionDownloadTask *downloadTask = [_afnManager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        
        
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        NSString *oldPath  = [[documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]] path];
        BOOL blDele= [[NSFileManager
                        defaultManager] removeItemAtPath:oldPath error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        if(self.callback != nil)
        {
            [self.callback httpcallbackWithProtocolIdAndStringData:1 httpCallbackStatus:1 httpCallbackData:[filePath path] ];
        }
        NSLog(@"File downloaded to: %@", filePath);
    }];
    
    //重新开始下载
    [downloadTask resume];
}

/**
加载html页面

@param url <#url description#>
*/
- (void)loadHtmlFile:(NSString *)url
{
    
    [_afnManager GET:url parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //解析数据
        NSString * str  =[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSArray *tempList = [str componentsSeparatedByString:@"var menu = JSON.parse('"];
        NSArray *contentList = [tempList[1] componentsSeparatedByString:@"');"];
        NSDictionary * jsonData = [IdolTvTypeConvertUtil SConvertNSStringToNSMutableDictionary:contentList[0]];
        [self.callback httpCallbackWithProtocolIdAndDicData:4 httpCallbackStatus:1 httpCallbackData:jsonData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [self.callback httpCallbackWithProtocolIdAndDicData:4 httpCallbackStatus:-1 httpCallbackData:[[NSDictionary alloc]init]];
    }];
}

/**
 获取版本号
 
 @param url 地址
 */
- (void)getVersion:(NSString *)url
{
    NSURL *URL = [NSURL URLWithString:url];
    NSURLRequest *request = [NSURLRequest requestWithURL:URL];
    
    NSURLSessionDownloadTask *downloadTask = [_afnManager downloadTaskWithRequest:request progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
        if(self.callback != nil)
        {
            [self.callback httpcallbackWithProtocolIdAndStringData:3 httpCallbackStatus:1 httpCallbackData:[filePath path] ];
        }
        NSLog(@"File downloaded to: %@", filePath);
    }];
    
    //重新开始下载
    [downloadTask resume];
}


/**
 *  @author LionelZhang
 *
 *  @brief 获取http的code
 *
 *  @return code
 */
- (int)getHttpCodeWithDicData:(NSDictionary *)sorData
{
    return ((NSNumber *)[sorData objectForKey:@"errcode"]).intValue;
}

@end
