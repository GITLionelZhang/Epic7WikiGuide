//
//  Epic7GuideItem.m
//  Epic7Guide
//
//  Created by 张真 on 2019/3/10.
//  Copyright © 2019 张真. All rights reserved.
//

#import "Epic7GuideItem.h"

@implementation Epic7GuideItem



- (id)initWithName:(NSString *)name children:(NSMutableArray *)children
{
    self = [super init];
    if (self) {
        self.children = [NSMutableArray arrayWithArray:children];
        self.name = name;
    }
    return self;
}

+ (id)dataObjectWithName:(NSString *)name children:(NSMutableArray *)children
{
    return [[self alloc] initWithName:name children:children];
}

- (void)addChild:(id)child
{
    NSMutableArray *children = [self.children mutableCopy];
    [children insertObject:child atIndex:0];
    self.children = [children copy];
}

- (void)removeChild:(id)child
{
    NSMutableArray *children = [self.children mutableCopy];
    [children removeObject:child];
    self.children = [children copy];
}
@end
