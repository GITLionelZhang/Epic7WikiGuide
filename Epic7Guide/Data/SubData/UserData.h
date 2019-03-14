//
//  UserData.h
//  IdolTv
//
//  Created by 张 真 on 16/4/14.
//  Copyright © 2016年 张 真. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GDataXMLNode.h>

@interface UserData : NSObject
//user id
@property(nonatomic) int userId;
//user name
@property (nonatomic,copy) NSString *userName;
//user detail info page
@property (nonatomic,copy) NSString *articleAddress;
//user avatar image address
@property (nonatomic,copy) NSString *avatarAddress;
//user upgrade type
@property (nonatomic,copy) NSString *upgradeType;
//user hit type
@property (nonatomic,copy) NSString *hitType;
//user ability list
@property (nonatomic,copy) NSString *abilityType;
//user review value
@property (nonatomic,copy) NSString *reviewValue;
//user take type
@property (nonatomic,copy) NSString *takeType;

-(void)ParseDataFromXml:(GDataXMLElement*)node;

@end
