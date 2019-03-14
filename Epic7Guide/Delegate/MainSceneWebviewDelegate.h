//
//  MainSceneWebviewDelegate.h
//  OhBike
//
//  Created by 张 真 on 16/10/30.
//  Copyright © 2016年 张 真. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IdolTvTypeConvertUtil.h"
#import <AVFoundation/AVFoundation.h>
#import "IdolTvEnvStatic.h"

/**
 *  @author LionelZhang
 *
 *  @brief 获取车辆列表的方法名
 */
static NSString* const WEB_VIEW_SIGNATURE_GET_BIKE_LIST = @"getBikeListSignature";

/**
 *  @author LionelZhang
 *
 *  @brief 上传头像
 */
static NSString* const WEB_VIEW_SIGNATURE_UPLOAD_AVATAR = @"uploadAvatar";

/**
 *  @author LionelZhang
 *
 *  @brief 上传普通图片
 */
static NSString* const WEB_VIEW_SIGNATURE_UPLOAD_NORMAL_IMAGE = @"uploadNormalImage";

/**
 *  @author LionelZhang
 *
 *  @brief 充值
 */
static NSString* const WEB_VIEW_SIGNATURE_RECHARGE = @"recharge";

/**
 *  @author LionelZhang
 *
 *  @brief 获取停车点
 */
static NSString* const WEB_VIEW_SIGNATURE_GET_BIKE_BACK_RACK_LIST = @"getBikeBackRackList";

/**
 *  @author LionelZhang
 *
 *  @brief 获取合法区域
 */
static NSString* const WEB_VIEW_SIGNATURE_GET_LEGAL_REGION_LIST = @"getLegalRegionList";

/**
 *  @author LionelZhang
 *
 *  @brief h5弹出框类型单选项确认框
 */
static NSString* const H5_ALERT_DIALOG_TYPE_SINGLE = @"alert";

/**
 *  @author LionelZhang
 *
 *  @brief h5弹出框类型双选项确认框
 */
static NSString* const H5_ALERT_DIALOG_TYPE_DOUBLE = @"confirm";


@interface MainSceneWebviewDelegate : NSObject
{
    OhBikeWKWebview *nowWebview;
}

/**
 初始化数据
 
 @param webview webview实例
 */
- (void)initOhbikeWebviewWithWebview:(OhBikeWKWebview *)webview;

/**
 销毁所有实例
 */
- (void)disposeAll;

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
- (void)initUserInfoWithUserKey:(NSString *)userKey AndUserNickName:(NSString *)userNickName AndDeviceKey:(NSString *) deviceKey AndAppVersionName:(NSString*)appVersionName AndDeviceModel:(NSString *)deviceModel AndLoginType:(int)loginType AndH5LanuageType:(NSString *)languageType AndOrderId:(NSString*)orderId AndShowCheckBox:(int)showCheckBox AndVersionName:(NSString *)versionName;

/**
 显示预约车辆页面
 
 @param distence 距离
 @param rideMin  走过去多久
 @param bikeId   车的id
 @param place    车的位置
 */
- (void)showBookingBikePageWithDistance:(float)distence AndMinute:(int)rideMin AndBikeId:(int)bikeId AndPlace:(NSString*)place;

/**
 设置位置查询的结果列表

 @param result 结果数据(json)
 */
- (void)setLocationSearchResult:(NSString*)result;

/**
 设置当前位置

 @param myLocation 当前我的位置
 */
- (void)setSearchLocation:(NSString *)myLocation;

/**
 开锁

 @param bikeId 车的id
 */
- (void)showOpenActionWithBikeId:(NSString *)bikeId;


/**
 用户充值成功
 */
- (void)userRechargeCompleted;


/**
 显示刷新按钮
 */
- (void)showRefreshButton;


/**
 隐藏刷新按钮
 */
- (void)hideRefreshButton;

/**
 开始刷新动画
 */
- (void)beginRefreshButton;

/**
 结束刷新动画
 */
- (void)stopRefreshButton;

/**
 设置当前手机的位置信息
 
 @param latitude 纬度
 @param longitude 经度
 @param coordType 坐标类型
 */
- (void)setNowPhoneLocationWithLatitude:(float)latitude AndLongitude:(float)longitude AndCoordType:(int)coordType;



/**
 用户更换头像成功
 */
- (void)userChangeAvatarCompeleted;

/**
 开锁成功

 @param macAddress mac地址
 @param battery 电池电量
 */
- (void)bluetoothLockOpenedWithMacAddress:(NSString*)macAddress AndBattery:(int)battery;

/**
 关锁成功

 @param macAddress mac地址
 
 */
- (void)bluetoothLockClosedWithMacAddress:(NSString*)macAddress;


/**
 强制结束订单

 @param state 当前锁状态
 @param battery 电池电量
 */
- (void)forcedEndOfOrder:(int)state AndBattery:(int)battery;

/**
 获取请求车辆列表的签名数据
 
 @param lat 纬度
 @param lng 经度
 @param distance 距离
 @param coordType 坐标类型
 @param bounds 相机的边界
 @param zoomLevel 缩放等级
 */
- (void)getBikeListSignatureWithLat:(double)lat AndLng:(double)lng AndDistance:(int)distance AndCoordType:(int)coordType AndBounds:(GMSCoordinateBounds *)bounds AndZoomLevel:(float)zoomLevel;

/**
 获取上传头像签名数据
 */
- (void)getAvatarUploadImageSignature;

/**
 获取一般上传头像签名数据
 */
- (void)getNormalUploadImageSignature;

/**
 获取充值的签名数据
 
 @param channel 充值渠道
 @param amount 充值数量
 @param type 充值类型
 */
- (void)getRechargeSignatureWithChannel:(NSString *)channel AndAmount:(float)amount AndType:(NSString *)type;

/**
 设置错误汇报的信息
 
 @param bikeId 车辆id
 @param reportClass 汇报类型
 */
- (void)setIssueReportBikeIdWithBikeId:(NSString *)bikeId AndReportClass:(NSString *)reportClass;

/**
 设置错误汇报的信息
 
 @param imageUrl 图片地址
 @param reportClass 汇报类型
 */
- (void)setIssueReportImageWithImageUrl:(NSString *)imageUrl AndReportClass:(NSString *)reportClass;

/**
 改变页面上的闪光灯图标状态
 
 @param status 当前状态
 */
- (void)changePageTorchStatus:(AVCaptureTorchMode)status;

/**
 设置蓝牙需要权限的提示
 
 @param status 当前状态
 */
- (void)setBluetoothPermissionPanelStatus:(int)status;

/**
 设置facebook的token
 
 @param accessToken facebook token
 */
- (void)setFacebookToken:(NSString *)accessToken;

/**
 隐藏登录界面的loading条
 */
- (void)hideLoginLoadingBar;

/**
 获取停车点数据的签名
 
 @param bounds 边界
 @param zoomLevel 当前缩放等级
 @param coordType 当前坐标系
 */
- (void)getBikeBackRackListSignatureWithBounds:(GMSCoordinateBounds *)bounds AndZoomLevel:(float)zoomLevel AndCoordType:(int)coordType;

/**
 通知js蓝牙设备已经连接
 
 @param macAddress 设备的mac地址
 @param power 设备的电量
 @param lockStatus 当前锁的状态
 */
- (void)connectBluetoothDeviceCompleteWithMacAddress:(NSString *)macAddress AndPower:(int)power AndLockStatus:(int)lockStatus;

/**
 改变停车点的tips状态
 
 @param isShow 是否显示
 */
- (void)changeBackRackTipsStatus:(BOOL)isShow;


/**
 摄像头视图添加完成
 */
- (void)cameraAddedCallback;

/**
 摄像头视图删除完成
 */
- (void)cameraRemovedCallback;

/**
 设置带label的提示框
 
 @param labelContent label的内容
 */
- (void)setDialogWithLabel:(NSString *)labelContent;

/**
 隐藏对话框
 */
- (void)hideDialogWithLabel;

/**
 显示扫描页面
 */
- (void)beginShowScanPage;

/**
 显示重试和联系客服弹框
 */
- (void)webviewShowRetryAndContactDialog;

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
- (void)webviewShowDialogWithType:(NSString *)dialogType AndTitle:(NSString *)title AndContent:(NSString *)content AndLeftBtnText:(NSString *)leftBtnText AndLeftBtnKey:(NSString*)leftBtnKey AndRightText:(NSString*)rightBtnText AndRightKey:(NSString*)rightBtnKey;

/**
 提交推送的唯一标识给服务器

 @param deviceToken 唯一标识
 */
- (void)uploadDeviceTokenToServer:(NSString *)deviceToken;

/**
 设置查询历史记录
 
 @param history 历史记录
 */
- (void)setSearchHistory:(NSString *)history;

/**
 隐藏marker的详细面板
 */
- (void)hidePickerWindow;

/**
 显示marker的详细面板
 */
- (void)showPickerWindowWithData:(NSDictionary *)data;

/**
 报告错误完成
 */
- (void)reportFaultCompelete;

/**
 获取合法区域的点集
 */
- (void)getLegalRegionSingature;

/**
 刷新订单
 
 @param orderId <#orderId description#>
 */
- (void)enableOrderWithOrderId:(NSString *)orderId;

/**
 更改loading条的状态
 
 @param status 状态
 */
- (void)changeLoadingBarStatus:(int)status;

/**
 显示面板

 @param info 内容
 */
- (void)showIdPanel:(NSDictionary *)info;

/**
 显示推送消息
 
 @param info 内容
 */
- (void)showExchangePanel:(NSString *)info;

/**
 汇报token给服务器

 @param token 推送token
 @param userId 用户id
 */
- (void) updateTokenKeyToServer:(NSString *)token AndUserId:(int)userId;


@end
