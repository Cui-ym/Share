//
//  DropDown.h
//  share
//
//  Created by 崔一鸣 on 2017/7/28.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DropDown : UIView<UITableViewDelegate, UITableViewDataSource>
{
    UIView *view;
    UIButton *btn;
    BOOL showList;//是否弹出下拉列表
    CGFloat tabHeight;//table下拉列表的高度
    CGFloat frameHeight;//frame的高度
}

@property (nonatomic) UITableView *tab;
@property (nonatomic) NSArray *tableArray;
@property (nonatomic) UITextField *lab;

@end
