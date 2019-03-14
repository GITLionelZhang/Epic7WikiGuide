//
//  IdolTvTypeConvertUtil.h
//  IdolTv
//
//  Created by 张 真 on 16/5/10.
//  Copyright © 2016年 张 真. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface IdolTvTypeConvertUtil : NSObject

/**
 *  @author LionelZhang
 *
 *  @brief 把字典转成json字符串
 *
 *  @param dict 字典
 *
 *  @return json字符串
 */
+ (NSString*) SConvertNSDictionaryToNSString:(NSDictionary*)dict;

/**
 base64解码

 @param sorStr 源字符串
 @return 结果字符串
 */
+ (NSString*) SDecodeBase64String:(NSString*)sorStr;

/**
 base64编码
 
 @param sorStr 源字符串
 @return 编码后字符串
 */
+ (NSString*) SEncodeBase64String:(NSString*)sorStr;


/**
 把字符串转换成字典

 @param sorStr 源字符串
 @return 字典
 */
+ (NSMutableDictionary*) SConvertNSStringToNSMutableDictionary:(NSString*)sorStr;


/**
 nsdata转成16进制字符串
 
 @param data 源数据
 @return 返回转换后的字符串
 */
+(NSString*)dataToHexString:(NSData*)data;

/**
 根据位置的列表获取json数据

 @param locList 位置数据
 @return json字符串
 */
+(NSString*)locationListToJsonData:(NSArray *)locList;

/**
 16进制转10进制数据

 @param hexStr 16进制的数据字符串
 @return 10进制数值
 */
+ (int)HexToDecimal:(NSString *)hexStr;

/**
 缩放图片到一定大小

 @param image 图片
 @param size 目标大小
 @return 目标图片
 */
+ (UIImage *)scaleUIImage:(UIImage *)image scaleToSize:(CGSize)size;

/**
 aes256解码
 
 @param sorStr 源串
 @return <#return value description#>
 */
+ (NSDictionary*)decodeAes256:(NSString*)sorStr;


/**
 判断当前是否为int

 @param string 源字符串
 @return <#return value description#>
 */
+ (BOOL)isPureInt:(NSString *)string;
@end
