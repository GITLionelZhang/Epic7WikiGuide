//
//  IdolTvHtmlMethodNameStatic.h
//  IdolTv
//
//  Created by 张 真 on 16/4/15.
//  Copyright © 2016年 张 真. All rights reserved.
//

#import <Foundation/Foundation.h>
/**
 *  @author LionelZhang
 *
 *  @brief 主页准备完毕
 */
static NSString* const IndexPageReady = @"indexready";

/**
 *  @author LionelZhang
 *
 *  @brief 房间页顶部的高度
 */
static NSString* const IndexTopBarHeight = @"topbarheight";

/**
 *  @author LionelZhang
 *
 *  @brief 跳转到登录页面
 */
static NSString* const RedictToLoginPage = @"redicttologinpage";

/**
 *  @author LionelZhang
 *
 *  @brief 跳转到个人页面
 */
static NSString* const  RedictToProfilePage= @"redicttoprofilepage";

/**
 *  @author LionelZhang
 *
 *  @brief 跳转到搜索页面
 */
static NSString* const  RedictToSearchPage= @"redicttosearchpage";

/**
 *  @author LionelZhang
 *
 *  @brief 跳转到弹出框页面
 */
static NSString* const  RedictToAlertPage= @"redicttoalertpage";

/**
 *  @author LionelZhang
 *
 *  @brief 刷新车的列表
 */
static NSString* const RefreshBikeList = @"refreshbikelist";

/**
 *  @author LionelZhang
 *
 *  @brief 重新定位
 */
static NSString* const ReLocMyPosition = @"relocmyposition";

/**
 *  @author LionelZhang
 *
 *  @brief 通过关键字查询
 */
static NSString* const  LocationSearchWithWord= @"locationsearchwithword";

/**
 *  @author LionelZhang
 *
 *  @brief 点击了微信登录按钮
 */
static NSString* const  PressWeChatLoginBtn= @"presswechatloginbtn";

/**
 *  @author LionelZhang
 *
 *  @brief 开始扫码
 */
static NSString* const  BeginToScan= @"begintoscan";

/**
 *  @author LionelZhang
 *
 *  @brief 设置最终的查询数据
 */
static NSString* const  SetSearchLOcationFinalData= @"setsearchlocationfinaldata";

/**
 *  @author LionelZhang
 *
 *  @brief 登出成功
 */
static NSString* const  LogoutComplete= @"logoutcompelete";

/**
 *  @author LionelZhang
 *
 *  @brief 登录成功之后回调
 */
static NSString* const  userdatacallback= @"userdatacallback";

/**
 *  @author LionelZhang
 *
 *  @brief 用户充值
 */
static NSString* const  userrecharge= @"userrecharge";

/**
 *  @author LionelZhang
 *
 *  @brief 初始化页面元素树
 */
static NSString* const  inithtmlnodes= @"initHtmlNodes";

/**
 *  @author LionelZhang
 *
 *  @brief 添加页面元素树
 */
static NSString* const  addhtmlnode= @"addHtmlNode";

/**
 *  @author LionelZhang
 *
 *  @brief 移除页面元素
 */
static NSString* const  removehtmlnode= @"removeHtmlNode";

/**
 *  @author LionelZhang
 *
 *  @brief 修改页面元素
 */
static NSString* const  modifyhtmlnode= @"modifyHtmlNode";

/**
 *  @author LionelZhang
 *
 *  @brief 获取当前手机位置信息
 */
static NSString* const  getnowphonelocation= @"getNowPhoneLocation";

/**
 *  @author LionelZhang
 *
 *  @brief 通过摄像头换头像
 */
static NSString* const  changeAvatarFromCamara= @"changeAvatarFromCamara";

/**
 *  @author LionelZhang
 *
 *  @brief 通过本地图像换头像
 */
static NSString* const  changeAvatarFromPhoto= @"changeAvatarFromPhoto";

/**
 *  @author LionelZhang
 *
 *  @brief js回调统一接口
 */
static NSString* const  callSystemFunction= @"callSystemFunction";

/**
 *  @author LionelZhang
 *
 *  @brief 查询蓝牙设备
 */
static NSString* const  searchBluetoothDevice= @"searchBluetoothDevice";

/**
 *  @author LionelZhang
 *
 *  @brief 蓝牙锁结束订单
 */
static NSString* const  checkBluetoothDevice= @"checkBluetoothDevice";

/**
 *  @author LionelZhang
 *
 *  @brief 签名返回
 */
static NSString* const  setSignature= @"setSignature";

/**
 *  @author LionelZhang
 *
 *  @brief 错误上报获取车辆id
 */
static NSString* const  issuereportgetbikeid= @"getBikeId";

/**
 *  @author LionelZhang
 *
 *  @brief 错误上报获取车辆照片
 */
static NSString* const issuereportgetuploadimageurl= @"getUploadImageUrl";

/**
 *  @author LionelZhang
 *
 *  @brief 扫码页面准备好
 */
static NSString* const scanqrcodeready = @"scanQrCodeReady";

/**
 *  @author LionelZhang
 *
 *  @brief 扫码页面关闭完毕
 */
static NSString* const scanqrcodeclose = @"scanQrCodeClose";

/**
 *  @author LionelZhang
 *
 *  @brief 打开手电筒
 */
static NSString* const openFlashLight = @"openFlashLight";

/**
 *  @author LionelZhang
 *
 *  @brief 关闭手电筒
 */
static NSString* const closeFlashLight = @"closeFlashLight";

//进入了客服页面
static NSString* const joinReportPage = @"joinReportPage";

//离开了客服页面
static NSString* const leaveReportPage = @"leaveReportPage";

//facebook登录
static NSString* const facebookLogin = @"facebooklogin";

//设置订单信息
static NSString* const setOrderId = @"setOrderId";

//点击了客服按钮
static NSString* const clickReportButton = @"clickReportButton";

//创建订单完成需要开锁
static NSString* const createOrderComplete = @"createOrderComplete";

//当前订单状态
static NSString* const setOrderStatus = @"setOrderStatus";

//分享邀请
static NSString* const shareInvitingCodePage = @"shareInvitingCodePage";

//扫码之前需要先检查蓝牙权限
static NSString* const needcheckbluetoothbeforescan = @"needcheckbluetoothbeforescan";

//重新结束订单
static NSString* const reconnectBlueTooth = @"reconnectBlueTooth";

//弹出蓝牙请求的提示框
static NSString* const showBluetoothSystemBox = @"showBluetoothSystemBox";

//h5请求获取查询历史
static NSString* const getSearchHistory = @"getSearchHistory";

//设置查询历史
static NSString* const setSearchHistory = @"setSearchHistory";

//添加历史记录
static NSString* const addSearchHistory = @"addSearchHistory";

//清除历史记录
static NSString* const clearSearchHistory = @"clearSearchHistory";

//设置推送
static NSString* const setNotification = @"setNotification";

//flurry埋点
static NSString* const pushFlurryPoint = @"pushFlurryPoint";

//客服问题回报
static NSString* const reportBikeIssueSubmit = @"reportBikeIssueSubmit";

//分享到社交网络统一接口
static NSString* const shareToSNS = @"shareToSNS";

