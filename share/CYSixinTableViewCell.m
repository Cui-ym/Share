//
//  CYSixinTableViewCell.m
//  share
//
//  Created by 崔一鸣 on 2017/7/31.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "CYSixinTableViewCell.h"

@implementation CYSixinTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.image = [[UIImageView alloc] init];
        [self.contentView addSubview:self.image];
        
        self.titleLab = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleLab];
        
        self.timeLab = [[UILabel alloc] init];
        [self.contentView addSubview:self.timeLab];
        
        self.lab = [[UILabel alloc] init];
        [self.contentView addSubview:self.lab];
    }
    
    return self;
}

- (void)layoutSubviews{
    self.image.frame = CGRectMake(40, 20, 50, 50);
    self.titleLab.frame = CGRectMake(105, 25, 200, 15);
    self.lab.frame = CGRectMake(105, 55, 200, 15);
    self.timeLab.frame = CGRectMake(280, 25, 100, 10);
    
    self.titleLab.font = [UIFont systemFontOfSize:15];
    self.lab.font = [UIFont systemFontOfSize:14];
    self.timeLab.font = [UIFont systemFontOfSize:11];
    
    self.lab.textColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    self.titleLab.textColor = [UIColor blackColor];
    self.timeLab.textColor = [UIColor colorWithRed:160/225.0 green:160/225.0 blue:160/225.0 alpha:1];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
