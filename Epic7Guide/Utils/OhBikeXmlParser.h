//
//  OhBikeXmlParser.h
//  OhBike
//
//  Created by 张 真 on 2017/4/11.
//  Copyright © 2017年 张 真. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OhBikeXmlParser : NSObject<NSXMLParserDelegate>
{
    //解析器
    NSXMLParser *parser;
}

/**
 通过文件路径解析xml文件

 @param filePath 文件路径
 */
- (void)parseXmlDataWithPath:(NSString *)filePath;

@end
