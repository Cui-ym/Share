//
//  MyTableViewCell.m
//  share
//
//  Created by 崔一鸣 on 2017/7/26.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "MyTableViewCell.h"

@implementation MyTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.titleImageView = [[UIImageView alloc] init];
        [self.contentView addSubview:self.titleImageView];
        
        self.titleLab = [[UILabel alloc] init];
        [self.contentView addSubview:self.titleLab];
        
        self.subtitleLab = [[UILabel alloc] init];
        [self.contentView addSubview:self.subtitleLab];
        
        self.writerLab = [[UILabel alloc] init];
        [self.contentView addSubview:self.writerLab];
        
        self.timeLab = [[UILabel alloc] init];
        [self.contentView addSubview:self.timeLab];
        
        self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:self.btn1];
        
        self.btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:self.btn2];
        
        self.btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [self.contentView addSubview:self.btn3];
    }
    
    return self;
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    // 设置大小
    self.titleImageView.frame = CGRectMake(0, 0, 170, self.contentView.frame.size.height);
    self.titleLab.frame = CGRectMake(185, 13, 160, 20);
    self.writerLab.frame = CGRectMake(185, 35, 160, 15);
    self.subtitleLab.frame = CGRectMake(185, 55, 160, 10);
    self.timeLab.frame = CGRectMake(185, 70, 160, 10);
    self.btn1.frame = CGRectMake(185, 95, 45, 15);
    self.btn2.frame = CGRectMake(240, 95, 45, 15);
    self.btn3.frame = CGRectMake(300, 95, 45, 15);
    
    // 设置字体
    self.titleLab.font = [UIFont systemFontOfSize:16];
    self.writerLab.font = [UIFont systemFontOfSize:12];
    self.subtitleLab.font = [UIFont systemFontOfSize:11];
    self.timeLab.font = [UIFont systemFontOfSize:11];
    
    // 设置按钮
    self.btn1.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    [self.btn1 setImage:[UIImage imageNamed:@"button_zan"] forState:UIControlStateNormal];
    self.btn2.imageEdgeInsets = UIEdgeInsetsMake(1.5, 0, 1.5, 25);
    [self.btn2 setImage:[UIImage imageNamed:@"button_guanzhu"] forState:UIControlStateNormal];
    self.btn3.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 30);
    [self.btn3 setImage:[UIImage imageNamed:@"button_share"] forState:UIControlStateNormal];
    
    [self.btn1 setTitleColor:[UIColor colorWithRed:0.21 green:0.56 blue:0.80 alpha:1] forState:UIControlStateNormal];
    [self.btn1 setTitle:@"102" forState:UIControlStateNormal];
    self.btn1.titleLabel.font = [UIFont systemFontOfSize:12];
    self.btn1.titleEdgeInsets = UIEdgeInsetsMake(2, -30, 2, 0);
    
    [self.btn2 setTitle:@"26" forState:UIControlStateNormal];
    self.btn2.titleLabel.font = [UIFont systemFontOfSize:12];
    self.btn2.titleEdgeInsets = UIEdgeInsetsMake(2, -50, 2, -10);
    [self.btn2 setTitleColor:[UIColor colorWithRed:0.21 green:0.56 blue:0.80 alpha:1] forState:UIControlStateNormal];
    
    [self.btn3 setTitle:@"20" forState:UIControlStateNormal];
    self.btn3.titleLabel.font = [UIFont systemFontOfSize:12];
    self.btn3.titleEdgeInsets = UIEdgeInsetsMake(2, -30, 2, 0);
    [self.btn3 setTitleColor:[UIColor colorWithRed:0.21 green:0.56 blue:0.80 alpha:1] forState:UIControlStateNormal];
    
    
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
