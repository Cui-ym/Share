//
//  LabelView.m
//  share
//
//  Created by 崔一鸣 on 2017/7/27.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "LabelView.h"

@implementation LabelView

- (id)initWithLabel:(NSString *)label{
    self = [super init];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"search_button"]];
    UILabel *label1 = [[UILabel alloc] init];
    if (self) {
        imageView.image = [UIImage imageNamed:@"search_button"];
        imageView.frame = CGRectMake(7, 3, 18, 18);
        [self addSubview:imageView];
        label1.text = label;
        label1.frame = CGRectMake(25, 0, 50, 25);
        label1.font = [UIFont systemFontOfSize:17];
        label1.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label1];
        label1.textColor = [UIColor whiteColor];
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
