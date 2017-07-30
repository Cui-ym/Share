//
//  MyCollectionViewCell.m
//  share
//
//  Created by 崔一鸣 on 2017/7/29.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageView];
        
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.imageView.frame = CGRectMake(0, 0, 120, 120);
    self.imageView.backgroundColor = [UIColor yellowColor];
}

@end
