//
//  HeroTableViewCell.h
//  GameWithMonsterList
//
//  Created by 张真 on 2017/9/13.
//  Copyright © 2017年 张真. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameDataInstance.h"
#import "HeroTableViewCellDelegate.h"


@interface HeroTableViewCell : UITableViewCell
{
}

@property(nonatomic,assign) id<HeroTableViewCellDelegate> delegate;

@property (nonatomic,strong) NSString *guideId;

@property (nonatomic,strong) NSString *imgUrl;

@property (nonatomic) int level;

@property (nonatomic) int childrenCount;


/**
 初始化数据
 */
-(void)initData;

+(instancetype)HeroTableViewCell;
@property (weak, nonatomic) IBOutlet UIImageView *imgHeroAvatar;
@property (weak, nonatomic) IBOutlet UILabel *txtHeroAbilityDetail;
@property (weak, nonatomic) IBOutlet UIImageView *imgArrow;

@property (nonatomic) UserData *heroData;


- (void)setTipIconStatus:(int)status;


-(void)setDataWithName:(NSString *)name AndImgUrl:(NSString*)url AndId:(NSString*) guideId AndLevel:(int)level AndChildrenCount:(int)count;

@end
