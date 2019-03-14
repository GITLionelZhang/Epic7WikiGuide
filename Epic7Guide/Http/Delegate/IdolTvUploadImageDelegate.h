//
//  IdolTvUploadImageDelegate.h
//  IdolTv
//
//  Created by 张 真 on 16/7/12.
//  Copyright © 2016年 张 真. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IdolTvUploadImageDelegate
/**
 *  @author LionelZhang
 *
 *  @brief 显示进度
 *
 *  @param progress <#progress description#>
 */
- (void)showUploadProgress:(int)progress;

/**
 *  @author LionelZhang
 *
 *  @brief 上传成功
 *
 *  @param url 上传成功的url地址
 */
- (void)finishAvatarUpload:(NSString*)avatartUrl;

/**
 上传头像失败
 */
- (void)avatarUploadFailed;

/**
 图片准备完毕
 */
- (void)selectImagePrepared;

@end
