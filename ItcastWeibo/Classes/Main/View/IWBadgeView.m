//
//  IWBadgeView.m
//  ItcastWeibo
//
//  Created by yz on 14/11/5.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "IWBadgeView.h"

#define HMBadgeTitleFont [UIFont systemFontOfSize:11]

@implementation IWBadgeView


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        
        UIImage *backgroundImage = [UIImage imageNamed:@"main_badge"];
        [self setBackgroundImage:backgroundImage forState:UIControlStateNormal];
        self.titleLabel.font = HMBadgeTitleFont;
        self.size = backgroundImage.size;

        self.userInteractionEnabled = NO;
    }
    return self;
}


- (void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue = badgeValue;
    
    [self setTitle:badgeValue forState:UIControlStateNormal];
    
    CGFloat titleW = [badgeValue boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : HMBadgeTitleFont} context:nil].size.width;
    
    if (titleW > self.width) { // 文字宽度大于按钮宽度
        [self setBackgroundImage:nil forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:@"new_dot"] forState:UIControlStateNormal];
    }else{
        [self setBackgroundImage:[UIImage imageNamed:@"main_badge"] forState:UIControlStateNormal];
        [self setImage:nil forState:UIControlStateNormal];
    }
    
}

@end
