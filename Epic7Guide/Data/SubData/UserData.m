//
//  UserData.m
//  IdolTv
//
//  Created by 张 真 on 16/4/14.
//  Copyright © 2016年 张 真. All rights reserved.
//

#import "UserData.h"

@implementation UserData

-(instancetype)init
{
    self.userId = -1;
    self.userName = @"";
    self.articleAddress = @"";
    self.avatarAddress = @"";
    self.upgradeType = @"";
    self.hitType = @"";
    self.abilityType = @"";
    self.reviewValue = @"";
    return self;
}
@end
