//
//  OhBikeXmlParser.m
//  OhBike
//
//  Created by 张 真 on 2017/4/11.
//  Copyright © 2017年 张 真. All rights reserved.
//

#import "OhBikeXmlParser.h"

@implementation OhBikeXmlParser


- (instancetype)init
{
    self = [super init];
    
    return self;
}

/**
 通过文件路径解析xml文件
 
 @param filePath 文件路径
 */
- (void)parseXmlDataWithPath:(NSString *)filePath
{
    parser = [[NSXMLParser alloc]initWithData:[NSData dataWithContentsOfFile:filePath]];
    parser.delegate = self;
    
    //开始解析
    [parser parse];
    
}

/**
 解析开始

 @param parser 解析器
 */
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    NSLog(@"begin parse XML");

}

/**
 解析结束

 @param parser 解析器
 */
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"finish parse XML");
}

/**
 解析错误

 @param parser 解析器
 @param parseError 错误信息
 */
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"parse XML Failed");
}

/**
 解析到具体数据

 @param parser 解析器
 @param string 字符数据
 */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string;
{
    NSLog(@"");
}

/**
 解析结束

 @param parser 解析器
 @param elementName 元素名称
 @param namespaceURI 名称空间
 @param qName 名字
 */
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    
}



@end
