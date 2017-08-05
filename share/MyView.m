//
//  MyView.m
//  share
//
//  Created by 崔一鸣 on 2017/7/31.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "MyView.h"

@implementation MyView

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        imageView = [[UIImageView alloc] initWithFrame:CGRectMake(35, 15, 100, 100)];
        imageView.image = [UIImage imageNamed:@"sixin_img1"];
        [self addSubview:imageView];
        titleLab = [[UILabel alloc] initWithFrame:CGRectMake(155, 25, 200, 15)];
        titleLab.text = @"Share小白";
        titleLab.font = [UIFont systemFontOfSize:16];
        [self addSubview:titleLab];
        
        lab1 = [[UILabel alloc] initWithFrame:CGRectMake(155, 45, 200, 15)];
        lab1.text = @"数媒/设计爱好者";
        lab1.font = [UIFont systemFontOfSize:11];
        [self addSubview:lab1];
        
        lab2 = [[UILabel alloc] initWithFrame:CGRectMake(155, 75, 200, 15)];
        lab2.text = @"开心了就笑，不开心了就过会儿再笑";
        lab2.font = [UIFont systemFontOfSize:12];
        [self addSubview:lab2];
        
        btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn1];
        btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn2];
        btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self addSubview:btn3];
        
        btn1.frame = CGRectMake(155, 100, 40, 20);
        btn2.frame = CGRectMake(210, 100, 50, 20);
        btn3.frame = CGRectMake(275, 100, 40, 20);
        [btn1 setImage:[UIImage imageNamed:@"img1"] forState:UIControlStateNormal];
        btn1.imageEdgeInsets = UIEdgeInsetsMake(2, 0, 2, 20);
        [btn2 setImage:[UIImage imageNamed:@"button_zan"] forState:UIControlStateNormal];
        btn2.imageEdgeInsets = UIEdgeInsetsMake(1.5, 0, 1.5, 30);
        [btn3 setImage:[UIImage imageNamed:@"button_guanzhu"] forState:UIControlStateNormal];
        btn3.imageEdgeInsets = UIEdgeInsetsMake(3.5, 0, 3.5, 20);
        [btn1 setTitle:@"15" forState:UIControlStateNormal];
        btn1.titleEdgeInsets = UIEdgeInsetsMake(2, -35, 2, 0);
        btn1.titleLabel.font = [UIFont systemFontOfSize:13];
        [btn1 setTitleColor:[UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1] forState:UIControlStateNormal];
        [btn2 setTitle:@"120" forState:UIControlStateNormal];
        btn2.titleEdgeInsets = UIEdgeInsetsMake(2, -20, 2, 0);
        btn2.titleLabel.font = [UIFont systemFontOfSize:13];

        [btn2 setTitleColor:[UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1] forState:UIControlStateNormal];
        [btn3 setTitle:@"89" forState:UIControlStateNormal];
        btn3.titleEdgeInsets = UIEdgeInsetsMake(4, 25, 4, 0);
        btn3.titleEdgeInsets = UIEdgeInsetsMake(2, -35, 2, 0);
        btn3.titleLabel.font = [UIFont systemFontOfSize:13];

        [btn3 setTitleColor:[UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1] forState:UIControlStateNormal];
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
