//
//  DropDown.m
//  share
//
//  Created by 崔一鸣 on 2017/7/28.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "DropDown.h"

@implementation DropDown 

- (id)initWithFrame:(CGRect)frame{
    
    
    self = [super initWithFrame:frame];
    if (self){
        showList = NO;
        if (frame.size.height<200) {
            frameHeight = 200;
        }else{
            frameHeight = frame.size.height;
        }
        tabHeight = frameHeight - 30;
        frame.size.height = 30.0f;
        // 设置边框
//        UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
//        line.backgroundColor = [UIColor blackColor];
//        line.layer.masksToBounds = YES;
//        line.layer.cornerRadius = 3;
//        line.layer.borderWidth = 1;
//        [self addSubview:line];
        // 设置tableView
        _tab = [[UITableView alloc] initWithFrame:CGRectMake(3, 30, frame.size.width - 33, 0)];
        _tab.delegate = self;
        _tab.dataSource = self;
        _tab.backgroundColor = [UIColor whiteColor];
        _tab.separatorColor = [UIColor clearColor];
        _tab.hidden = YES;
        _tab.bounces = NO;
        [self addSubview:_tab];
        // 设置按钮
        btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 2;
        btn.layer.borderWidth = 1;
        btn.frame = CGRectMake(frame.size.width - 30, 0, 30, 30);
        [btn setImage:[UIImage imageNamed:@"倒三角 (1)"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"倒三角"] forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(dropDown) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = [UIColor whiteColor];
        // 设置lab
        _lab = [[UITextField alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 30)];
        _lab.borderStyle=UITextBorderStyleNone;//设置文本框的边框风格
        _lab.layer.masksToBounds = YES;
        _lab.layer.cornerRadius = 3;
        _lab.layer.borderWidth = 1;
        _lab.backgroundColor = [UIColor whiteColor];
        _lab.userInteractionEnabled = YES;
        _lab.textAlignment = NSTextAlignmentLeft;
        _lab.font = [UIFont systemFontOfSize:13];
        _lab.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 0)];
        //设置显示模式为永远显示(默认不显示)
        _lab.leftViewMode = UITextFieldViewModeAlways;
        [_lab addSubview:btn];
        [self addSubview:_lab];
        
        
        
    }
    return self;
}

- (void)dropDown{
    if (showList){
        return;
    } else {
        btn.selected = YES;
        CGRect rect = self.frame;
        rect.size.height = frameHeight;
        
        [self.superview bringSubviewToFront:self];
        _tab.hidden = NO;
        showList = YES;
        _lab.backgroundColor = [UIColor colorWithRed:190/225.0 green:190/225.0 blue:190/225.0 alpha:1];
        btn.backgroundColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];

        CGRect frame = _tab.frame;
        frame.size.height = 0;
        _tab.frame = frame;
        frame.size.height = [_tableArray count] * 20;
        [UIView beginAnimations:@"ResizeForKeyBoard" context:nil];
        [UIView setAnimationCurve:UIViewAnimationCurveLinear];
        self.frame = rect;
        _tab.frame = frame;
        [UIView commitAnimations];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_tableArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 0, 85, 20)];
    label.text = [_tableArray objectAtIndex:[indexPath row]];
    label.font = [UIFont systemFontOfSize:12];
    label.text = [_tableArray objectAtIndex:[indexPath row]];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.backgroundColor = [UIColor colorWithRed:190/225.0 green:190/225.0 blue:190/225.0 alpha:1];
    [cell.contentView addSubview:label];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 20;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _lab.backgroundColor = [UIColor whiteColor];
    _lab.text = [_tableArray objectAtIndex:[indexPath row]];
    showList = NO;
    _tab.hidden = YES;
    btn.backgroundColor = [UIColor whiteColor];
    btn.selected = NO;
    
    CGRect sf = self.frame;
    sf.size.height = 30;
    self.frame = sf;
    CGRect frame = _tab.frame;
    frame.size.height = 0;
    _tab.frame = frame;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
