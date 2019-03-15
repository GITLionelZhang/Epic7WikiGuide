//
//  HeroTableViewCell.m
//  GameWithMonsterList
//
//  Created by 张真 on 2017/9/13.
//  Copyright © 2017年 张真. All rights reserved.
//

#import "HeroTableViewCell.h"

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

@implementation HeroTableViewCell


//实现类方法
 +(instancetype)HeroTableViewCell {
     
     return [[[NSBundle mainBundle] loadNibNamed:@"HeroTableViewCell" owner:nil options:nil] lastObject];
     
 }

/**
 初始化数据
 */
-(void)initData
{
}

-(void)clickBtn
{
    NSLog(@"fdaklfjdal");
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    if ([touch.view isKindOfClass:[UISwitch class]])
    {
        return NO;
    }
    // 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"]) {
        return NO;
    }
    return YES;
}

- (void)setTipIconStatus:(int)status
{
    switch (status) {
        case 0:
            {
                [self.imgArrow setImage:nil];
            }
            break;
        case 1:
        {
            if(self.childrenCount == 0 )
            {
                return ;
            }
            [self.imgArrow setImage:[UIImage imageNamed:@"ArrowDown"]];
        }
            break;
        case 2:
        {
            if(self.childrenCount == 0 )
            {
                return ;
            }
            [self.imgArrow setImage:[UIImage imageNamed:@"ArrowRight"]];
        }
            break;
            
        default:
            break;
    }
}

-(void)setDataWithName:(NSString *)name AndImgUrl:(NSString*)url AndId:(NSString*) guideId AndLevel:(int)level AndChildrenCount:(int)count
{
    self.guideId = guideId;
    self.txtHeroAbilityDetail.font = [UIFont fontWithName:@"Arial" size:10];
    self.imgUrl = url;
    self.level = level;
    self.childrenCount = count;
    if (level == 0) {
        self.backgroundColor = UIColorFromRGB(0xF7F7F7);
    } else if (level == 1) {
        self.backgroundColor = UIColorFromRGB(0xD1EEFC);
    } else if (level >= 2) {
        self.backgroundColor = UIColorFromRGB(0xE0F8D8);
    }
    if(count == 0)
    {
        [self setTipIconStatus:0];
    }
    else
    {
        [self setTipIconStatus:2];
    }
    self.frame = CGRectMake(0+level * 10, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    self.txtHeroAbilityDetail.text = name;
    
    
    if([[[GameDataInstance Instance] imageDict] objectForKey:guideId] != nil)
    {
        self.imgHeroAvatar.image = [[[GameDataInstance Instance] imageDict] objectForKey:guideId];
    }
    else
    {
        self.imgHeroAvatar.image = [UIImage imageNamed:@"DefaultImage"];
        NSInvocationOperation *op = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(downloadAvatar) object:nil];
        [operationQueue addOperation:op];
    }
}

- (void)downloadAvatar
{
    
    NSURL *imageUrl = [NSURL URLWithString:[NSString stringWithFormat:@"http:%@",self.imgUrl]];
    if(imageUrl == nil|| [self.imgUrl isEqualToString:@""] || self.imgUrl == nil)
    {
        return;
    }
    
    // 保存文件的名称
    UIImage *img = [UIImage imageWithContentsOfFile:[self getImagePath:self.imgUrl]];
    
    if(img == nil)
    {
        img = [UIImage imageWithData:[NSData dataWithContentsOfURL:imageUrl]];
        
        [UIImagePNGRepresentation(img) writeToFile:[self getImagePath:self.imgUrl] atomically:YES];
    }
    dispatch_sync(dispatch_get_main_queue(), ^{
         self.imgHeroAvatar.image = img;
    });

    
    
    [[[GameDataInstance Instance] imageDict] setObject:img forKey:self.guideId];
}

- (NSString*)getImagePath:(NSString *)name {
    
    NSArray *path = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    
    NSString *docPath = [path objectAtIndex:0];
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    
    NSString *finalPath = [docPath stringByAppendingPathComponent:name];
    
    [fileManager createDirectoryAtPath:[finalPath stringByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];//stringByDeletingLastPathComponent是关键
    
    return finalPath;
    
}


@end
