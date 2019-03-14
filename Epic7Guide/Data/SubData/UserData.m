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
    self.userName = @"";
    self.articleAddress = @"";
    self.avatarAddress = @"";
    self.upgradeType = @"";
    self.hitType = @"";
    self.abilityType = @"";
    self.reviewValue = @"";
    return self;
}

-(void)ParseDataFromXml:(GDataXMLElement*)node
{
    self.userId =[[[node attributeForName:@"id"]  stringValue]intValue];
    self.userName = [[node attributeForName:@"name"] stringValue];
    self.articleAddress = [[node attributeForName:@"articleAddress"] stringValue];
    self.avatarAddress = [[node attributeForName:@"avatarAddress"] stringValue];
    self.upgradeType = [[node attributeForName:@"upgradeType"] stringValue];
    self.hitType = [[node attributeForName:@"hitType"] stringValue];
    NSArray *hitDetailArr = [self.hitType componentsSeparatedByString:@" "];
    self.hitType = hitDetailArr[0];
    self.takeType = hitDetailArr[hitDetailArr.count - 1];
    self.abilityType = [[node attributeForName:@"abilityType"] stringValue];
    self.abilityType = [self.abilityType stringByReplacingOccurrencesOfString:@"アビリティ :" withString:@""];
    self.abilityType = [self.abilityType stringByReplacingOccurrencesOfString:@"ゲージ :" withString:@"蓄力:"];
    self.abilityType = [self.abilityType stringByReplacingOccurrencesOfString:@"アンチ重力バリア" withString:@"反重力"];
    self.abilityType = [self.abilityType stringByReplacingOccurrencesOfString:@"アンチダメージウォール" withString:@"反伤害壁"];
    self.abilityType = [self.abilityType stringByReplacingOccurrencesOfString:@"アンチワープ" withString:@"反传送"];
    self.abilityType = [self.abilityType stringByReplacingOccurrencesOfString:@"アンチ魔法陣" withString:@"反魔法"];
    self.abilityType = [self.abilityType stringByReplacingOccurrencesOfString:@"アンチウィンド" withString:@"反风"];
    self.abilityType = [self.abilityType stringByReplacingOccurrencesOfString:@"アンチブロック" withString:@"反砖块"];
    self.abilityType = [self.abilityType stringByReplacingOccurrencesOfString:@"マインスイーパー" withString:@"扫雷"];
    self.reviewValue = [[node attributeForName:@"reviewValue"] stringValue];
    self.reviewValue = [NSString stringWithFormat:@"%.1f",[self.reviewValue floatValue]];
}
@end
