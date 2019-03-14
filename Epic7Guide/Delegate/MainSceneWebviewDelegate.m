//
//  MainSceneWebviewDelegate.m
//  OhBike
//
//  Created by 张 真 on 16/10/30.
//  Copyright © 2016年 张 真. All rights reserved.
//

#import "MainSceneWebviewDelegate.h"

@implementation MainSceneWebviewDelegate


/**
 初始化数据
 
 @param webview webview实例
 */
- (void)initOhbikeWebviewWithWebview:(OhBikeWKWebview *)webview
{
    nowWebview = webview;
}

/**
 销毁所有实例
 */
- (void)disposeAll
{
    nowWebview = nil;
}

/**
 初始化用户数据
 
 @param userKey 用户唯一标识
 @param userNickName 用户昵称
 @param deviceKey 设备唯一标识
 @param appVersionName app的版本号
 @param deviceModel 手机型号
 @param loginType 登录类型
 @param languageType 语言类型
 @param orderId 订单信息
 @param showCheckBox 是否显示勾选框
 @param versionName 版本号
 */
- (void)initUserInfoWithUserKey:(NSString *)userKey AndUserNickName:(NSString *)userNickName AndDeviceKey:(NSString *) deviceKey AndAppVersionName:(NSString*)appVersionName AndDeviceModel:(NSString *)deviceModel AndLoginType:(int)loginType AndH5LanuageType:(NSString *)languageType AndOrderId:(NSString*)orderId AndShowCheckBox:(int)showCheckBox AndVersionName:(NSString *)versionName
{
    NSString *url = [NSString stringWithFormat:@"initUserInfo(\'%@\',\'%@\',\'%@\',\'%@\',\'%@\',\'%d\',\'%@\',\'%@\',\'%d\',\'%@\',\'%@\')",userKey,userNickName,deviceKey,appVersionName,deviceModel,loginType,languageType,orderId,showCheckBox,[NSTimeZone systemTimeZone].abbreviation,versionName];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 显示预约车辆页面
 
 @param distence 距离
 @param rideMin  走过去多久
 @param bikeId   车的id
 @param place    车的位置
 */
- (void)showBookingBikePageWithDistance:(float)distence AndMinute:(int)rideMin AndBikeId:(int)bikeId AndPlace:(NSString*)place
{
    NSString *url = [NSString stringWithFormat:@"showBookingBikePage(\'1\',\'%f\',\'%d\',\'%d\',\'%@\')",distence,rideMin,bikeId,place];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 设置位置查询的结果列表
 
 @param result 结果数据(json)
 */
- (void)setLocationSearchResult:(NSString*)result
{
    NSString *url = [NSString stringWithFormat:@"setlocationsearchresult(\'%@\')",result];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 设置当前位置
 
 @param myLocation 当前我的位置
 */
- (void)setSearchLocation:(NSString *)myLocation
{
    NSString *url = [NSString stringWithFormat:@"setSearchLocation(\'%@\')",myLocation];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 开锁
 
 @param bikeId 车的id
 */
- (void)showOpenActionWithBikeId:(NSString *)bikeId
{
    NSString *url = [NSString stringWithFormat:@"showOpenAction(\'%@\')",bikeId];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
    
}

/**
 用户充值成功
 */
- (void)userRechargeCompleted
{
    NSString *url = [NSString stringWithFormat:@"userRechargeCompleted()"];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 显示刷新按钮
 */
- (void)showRefreshButton
{
    
    NSString *url = [NSString stringWithFormat:@"showRefreshButton()"];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
    
}


/**
 隐藏刷新按钮
 */
- (void)hideRefreshButton
{
    NSString *url = [NSString stringWithFormat:@"hideRefreshButton()"];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 开始刷新动画
 */
- (void)beginRefreshButton
{
    NSString *url = [NSString stringWithFormat:@"beginRefreshButton()"];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
    
}

/**
 结束刷新动画
 */
- (void)stopRefreshButton
{
    NSString *url = [NSString stringWithFormat:@"stopRefreshButton()"];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
    
}

/**
 设置当前手机的位置信息
 
 @param latitude 纬度
 @param longitude 经度
 @param coordType 坐标类型
 */
- (void)setNowPhoneLocationWithLatitude:(float)latitude AndLongitude:(float)longitude AndCoordType:(int)coordType
{
    NSString *url = [NSString stringWithFormat:@"setNowPhoneLocation(\'%f\',\'%f\',\'%d\')",latitude,longitude,coordType];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 用户更换头像成功
 */
- (void)userChangeAvatarCompeleted
{
    [nowWebview evaluateJavaScript:@"userChangeAvatarCompleted()" completionHandler:nil];
}

/**
 开锁成功
 */
- (void)bluetoothLockOpenedWithMacAddress:(NSString*)macAddress AndBattery:(int)battery
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'openBluetoothDevice\',\'%@\',\'%d\')",macAddress,battery];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 关锁成功
 */
- (void)bluetoothLockClosedWithMacAddress:(NSString*)macAddress
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'closeBluetoothDevice\',\'%@\')",macAddress];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 强制结束订单
 
 @param state 当前锁状态
 */
- (void)forcedEndOfOrder:(int)state AndBattery:(int)battery
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'forcedEndOfOrder\',\'%d\',\'%d\')",state,battery];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}


/**
 获取请求车辆列表的签名数据
 
 @param lat 纬度
 @param lng 经度
 @param distance 距离
 @param coordType 坐标类型
 @param bounds 相机的边界
 @param zoomLevel 缩放等级
 */
- (void)getBikeListSignatureWithLat:(double)lat AndLng:(double)lng AndDistance:(int)distance AndCoordType:(int)coordType AndBounds:(GMSCoordinateBounds *)bounds AndZoomLevel:(float)zoomLevel
{
    NSString *boundsStr = [NSString stringWithFormat:@"%lf,%lf;%lf,%lf",
                           bounds.southWest.latitude,
                           bounds.southWest.longitude,
                           bounds.northEast.latitude,
                           bounds.northEast.longitude
                           ];
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"geonear",@"t",
                            [NSString stringWithFormat:@"%lf",lat], @"lat",
                            [NSString stringWithFormat:@"%lf",lng],@"lng",
                            [NSString stringWithFormat:@"%d",distance],@"distance",
                            [NSString stringWithFormat:@"%d",coordType],@"coord_type",
                            boundsStr,@"bounds",
                            [NSString stringWithFormat:@"%lf",zoomLevel],@"zoom",
                            nil
                            ];
    
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'createSignature\',\'%@\',\'%@\')",[IdolTvTypeConvertUtil SConvertNSDictionaryToNSString:params],WEB_VIEW_SIGNATURE_GET_BIKE_LIST];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 获取上传头像签名数据
 */
- (void)getAvatarUploadImageSignature
{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"update",@"t",
                            @"avatar",@"act",
                            nil
                            ];
    
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'createSignature\',\'%@\',\'%@\')",[IdolTvTypeConvertUtil SConvertNSDictionaryToNSString:params],WEB_VIEW_SIGNATURE_UPLOAD_AVATAR];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 获取一般上传头像签名数据
 */
- (void)getNormalUploadImageSignature
{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"upload",@"t",
                            nil
                            ];
    
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'createSignature\',\'%@\',\'%@\')",[IdolTvTypeConvertUtil SConvertNSDictionaryToNSString:params],WEB_VIEW_SIGNATURE_UPLOAD_NORMAL_IMAGE];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}


/**
 获取合法区域的点集
 */
- (void)getLegalRegionSingature
{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"fences",@"t",
                            nil
                            ];
    
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'createSignature\',\'%@\',\'%@\')",[IdolTvTypeConvertUtil SConvertNSDictionaryToNSString:params],WEB_VIEW_SIGNATURE_GET_LEGAL_REGION_LIST];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 获取充值的签名数据
 
 @param channel 充值渠道
 @param amount 充值数量
 @param type 充值类型
 */
- (void)getRechargeSignatureWithChannel:(NSString *)channel AndAmount:(float)amount AndType:(NSString *)type
{
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"charge",@"t",
                            type,@"type",
                            channel,@"channel",
                            [NSString stringWithFormat:@"%f",amount],@"amount",
                            nil
                            ];
    
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'createSignature\',\'%@\',\'%@\')",[IdolTvTypeConvertUtil SConvertNSDictionaryToNSString:params],WEB_VIEW_SIGNATURE_RECHARGE];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 设置错误汇报的信息
 
 @param bikeId 车辆id
 @param reportClass 汇报类型
 */
- (void)setIssueReportBikeIdWithBikeId:(NSString *)bikeId AndReportClass:(NSString *)reportClass
{
    
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'setBikeId\',\'%@\',\'%@\')",bikeId,reportClass];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 设置错误汇报的信息
 
 @param imageUrl 图片地址
 @param reportClass 汇报类型
 */
- (void)setIssueReportImageWithImageUrl:(NSString *)imageUrl AndReportClass:(NSString *)reportClass
{
    
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'setUploadImageUrl\',\'%@\',\'%@\')",imageUrl,reportClass];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 改变页面上的闪光灯图标状态

 @param status 当前状态
 */
- (void)changePageTorchStatus:(AVCaptureTorchMode)status
{
    NSString *url;
    url = [NSString stringWithFormat:@"callH5Function(\'setFlashLightButtonType\',\'%d\')",(int)status];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 设置蓝牙需要权限的提示

 @param status 蓝牙权限提示
 */
- (void)setBluetoothPermissionPanelStatus:(int)status
{
    NSString *url;
    url = [NSString stringWithFormat:@"callH5Function(\'setBluetoothPopupType\',\'%d\')",(int)status];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}


/**
 设置facebook的token

 @param accessToken facebook token
 */
- (void)setFacebookToken:(NSString *)accessToken
{
    NSString *url;
    url = [NSString stringWithFormat:@"callH5Function(\'setFacebookToken\',\'%@\')",accessToken];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 隐藏登录界面的loading条
 */
- (void)hideLoginLoadingBar
{
    NSString *url;
    url = [NSString stringWithFormat:@"callH5Function(\'hideLoginLoadingBar\')"];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}


/**
 通知js蓝牙设备已经连接
 
 @param macAddress 设备的mac地址
 @param power 设备的电量
 @param lockStatus 当前锁的状态
 */
- (void)connectBluetoothDeviceCompleteWithMacAddress:(NSString *)macAddress AndPower:(int)power AndLockStatus:(int)lockStatus
{
    NSString *url;
    url = [NSString stringWithFormat:@"callH5Function(\'connectBluetoothDeviceComplete\',\'%@\',\'%d\',\'%d\')",macAddress,power,lockStatus];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 改变停车点的tips状态

 @param isShow 是否显示
 */
- (void)changeBackRackTipsStatus:(BOOL)isShow
{
    NSString *url;
    if(isShow)
    {
        url = [NSString stringWithFormat:@"callH5Function(\'showTipsBike\')"];
    }
    else
    {
        url = [NSString stringWithFormat:@"callH5Function(\'hideTipsBike\')"];
    }
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}


/**
 获取停车点数据的签名

 @param bounds 边界
 @param zoomLevel 当前缩放等级
 @param coordType 当前坐标系
 */
- (void)getBikeBackRackListSignatureWithBounds:(GMSCoordinateBounds *)bounds AndZoomLevel:(float)zoomLevel AndCoordType:(int)coordType
{
    
    NSString *boundsStr = [NSString stringWithFormat:@"%lf,%lf;%lf,%lf",bounds.southWest.latitude,bounds.southWest.longitude,bounds.northEast.latitude,bounds.northEast.longitude];
    NSLog(@"boundsStr:%@",boundsStr);
    
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"racklist",@"t",
                            [NSString stringWithFormat:@"%lf",zoomLevel],@"zoom",
                       [NSString stringWithFormat:@"%d",[IdolTvEnvStatic showBikeBackRackMarkerZoomLevel]] ,@"minz",
                            boundsStr,@"bounds",
                            nil
                            ];
    
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'createSignature\',\'%@\',\'%@\')",[IdolTvTypeConvertUtil SConvertNSDictionaryToNSString:params],WEB_VIEW_SIGNATURE_GET_BIKE_BACK_RACK_LIST];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 摄像头视图添加完成
 */
- (void)cameraAddedCallback
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'cameraAdded\')"];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 摄像头视图删除完成
 */
- (void)cameraRemovedCallback
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'cameraRemoved\')"];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 设置带label的提示框

 @param labelContent label的内容
 */
- (void)setDialogWithLabel:(NSString *)labelContent
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'setDialogWithLabel\',\'%@\')",labelContent];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 隐藏对话框
 */
- (void)hideDialogWithLabel
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'hideDialogWithLabel\')"];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 显示扫描页面
 */
- (void)beginShowScanPage
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'beginToScan\')"];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 显示重试和联系客服弹框
 */
- (void)webviewShowRetryAndContactDialog
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'showAlertByBlueTooth\')"];
    [nowWebview evaluateJavaScript:url completionHandler:nil];

}

/**
 h5显示的弹出框

 @param dialogType 当前弹出框的类型 H5_ALERT_DIALOG_TYPE_SINGLE/H5_ALERT_DIALOG_TYPE_DOUBLE
 @param title 抬头文字
 @param content 弹出框内容
 @param leftBtnText 左按钮文字
 @param leftBtnKey 左按钮触发唯一标识
 @param rightBtnText 右按钮文字
 @param rightBtnKey 右按钮触发唯一标识
 */
- (void)webviewShowDialogWithType:(NSString *)dialogType AndTitle:(NSString *)title AndContent:(NSString *)content AndLeftBtnText:(NSString *)leftBtnText AndLeftBtnKey:(NSString*)leftBtnKey AndRightText:(NSString*)rightBtnText AndRightKey:(NSString*)rightBtnKey
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'showAlert\',\'%@\',\'%@\',\'%@\',\'%@\',\'%@\',\'%@\',\'%@\')",dialogType,title,content,leftBtnText,leftBtnKey,rightBtnText,rightBtnKey];
    [nowWebview evaluateJavaScript:url completionHandler:nil];

}

/**
 提交推送的唯一标识给服务器
 
 @param deviceToken 唯一标识
 */
- (void)uploadDeviceTokenToServer:(NSString *)deviceToken
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'updateTokenKeyToServer\',\'%@\')",deviceToken];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 设置查询历史记录
 
 @param history 历史记录
 */
- (void)setSearchHistory:(NSString *)history
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'setSearchHistory\',\'%@\')",history];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 隐藏marker的详细面板
 */
- (void)hidePickerWindow
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'hidePicker\')"];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 显示marker的详细面板
 */
- (void)showPickerWindowWithData:(NSDictionary *)data
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'showPicker\',\'%@\')",[IdolTvTypeConvertUtil SConvertNSDictionaryToNSString:data]];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 报告错误完成
 */
- (void)reportFaultCompelete
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'reportBikeIssueComplete\')"];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 刷新订单

 @param orderId <#orderId description#>
 */
- (void)enableOrderWithOrderId:(NSString *)orderId
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'enableApp\',\'%@\')",orderId];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 更改loading条的状态

 @param status 状态
 */
- (void)changeLoadingBarStatus:(int)status
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'setLoadingBarType\',\'%d\')",status];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 显示面板
 
 @param info 内容
 */
- (void)showIdPanel:(NSDictionary *)info
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'showIdPanel\',\'%@\')",[IdolTvTypeConvertUtil SConvertNSDictionaryToNSString:info]];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 显示推送消息
 
 @param info 内容
 */
- (void)showExchangePanel:(NSString *)info
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'showExchangePanel\',\'%@\')",info];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

/**
 汇报token给服务器
 
 @param token 推送token
 @param userId 用户id
 */
- (void) updateTokenKeyToServer:(NSString *)token AndUserId:(int)userId
{
    NSString *url = [NSString stringWithFormat:@"callH5Function(\'updateTokenKeyToServer\',\'%@\',\'%d\',\'%d\')",token,userId,1];
    [nowWebview evaluateJavaScript:url completionHandler:nil];
}

@end
