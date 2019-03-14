//
//  HeroTableViewCellDelegate.h
//  GameWithMonsterList
//
//  Created by 张真 on 2018/1/13.
//  Copyright © 2018年 张真. All rights reserved.
//


@protocol HeroTableViewCellDelegate
/**
 点击了用户收藏

 @param userId 弹珠的id
 */
-(void)clickFavorButto:(int)userId AndIsFavor:(BOOL)isFavor;
@end
