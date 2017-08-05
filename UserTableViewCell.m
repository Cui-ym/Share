//
//  UserTableViewCell.m
//  share
//
//  Created by 崔一鸣 on 2017/7/30.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "UserTableViewCell.h"

@implementation UserTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self){
        self.image = [[UIImageView alloc] init];
        [self.contentView addSubview:self.image];
        self.lab = [[UILabel alloc] init];
        [self.contentView addSubview:self.lab];
        
        UIImageView *img = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"img3"]];
        img.frame = CGRectMake(305, 20, 15, 15);
        [self.contentView addSubview:img];
        
    }
    return self;

}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.image.frame = CGRectMake(35, 17, 15, 15);
    self.lab.frame = CGRectMake(70, 20, 150, 12);
    self.lab.font = [UIFont systemFontOfSize:16];
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
