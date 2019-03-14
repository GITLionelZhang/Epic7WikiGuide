//
//  Epic7GuideItem.h
//  Epic7Guide
//
//  Created by 张真 on 2019/3/10.
//  Copyright © 2019 张真. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Epic7GuideItem : NSObject

@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *iconUrl;
@property (strong, nonatomic) NSMutableArray *children;
@property (strong, nonatomic) NSString *guideId;
@property (nonatomic) int module;
@property (nonatomic) int level;
@property (strong,nonatomic) Epic7GuideItem *parent;

- (id)initWithName:(NSString *)name children:(NSMutableArray *)array;

+ (id)dataObjectWithName:(NSString *)name children:(NSMutableArray *)children;

- (void)addChild:(id)child;
- (void)removeChild:(id)child;

@end

NS_ASSUME_NONNULL_END
