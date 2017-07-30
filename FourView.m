//
//  FourView.m
//  share
//
//  Created by 崔一鸣 on 2017/7/27.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "FourView.h"

@implementation FourView

- (id)initWithText:(NSString *)text{
    self = [super init];
    if (self) {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 80, 30)];
        lab.text = text;
        lab.textAlignment = NSTextAlignmentCenter;
        lab.font = [UIFont systemFontOfSize:16];
        lab.backgroundColor = [UIColor whiteColor];
        lab.layer.masksToBounds = YES;
        lab.layer.cornerRadius = 3;
        [self addSubview:lab];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
