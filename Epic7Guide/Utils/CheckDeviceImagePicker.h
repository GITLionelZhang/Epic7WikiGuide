//
//  CheckDeviceImagePicker.h
//  IdolTv
//
//  Created by 张 真 on 16/6/30.
//  Copyright © 2016年 张 真. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import <WebKit/WebKit.h>

@interface CheckDeviceImagePicker : NSObject


// 判断设备是否有摄像头
+ (BOOL) isCameraAvailable;

// 前面的摄像头是否可用
+ (BOOL) isFrontCameraAvailable;

// 后面的摄像头是否可用
+ (BOOL) isRearCameraAvailable;

// 判断是否支持某种多媒体类型：拍照，视频
+ (BOOL) cameraSupportsMedia:(NSString *)paramMediaType sourceType:(UIImagePickerControllerSourceType)paramSourceType;

// 检查摄像头是否支持录像
+ (BOOL) doesCameraSupportShootingVideos;

// 检查摄像头是否支持拍照
+ (BOOL) doesCameraSupportTakingPhotos;

#pragma mark - 相册文件选取相关
// 相册是否可用
+ (BOOL) isPhotoLibraryAvailable;

// 是否可以在相册中选择视频
+ (BOOL) canUserPickVideosFromPhotoLibrary;

// 是否可以在相册中选择视频
+ (BOOL) canUserPickPhotosFromPhotoLibrary;
@end
