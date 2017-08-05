//
//  FourBtn.m
//  share
//
//  Created by 崔一鸣 on 2017/8/1.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "FourBtn.h"

@implementation FourBtn

- (id)initWithText:(NSString *)text{
    self = [super init];
    if (self) {
        self = [FourBtn buttonWithType:UIButtonTypeCustom];
        self.frame = CGRectMake(0, 0, 80, 30);
        [self setTitle:text forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        self.titleLabel.font = [UIFont systemFontOfSize:16];
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 3;
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
