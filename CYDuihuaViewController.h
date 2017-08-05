//
//  CYDuihuaViewController.h
//  share
//
//  Created by 崔一鸣 on 2017/7/31.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CYDuihuaViewController : UIViewController

@property (nonatomic,retain) UITableView *tableView;
@property (nonatomic,retain) NSMutableArray *messageArray;
@property (nonatomic,retain) NSMutableArray *rowheightArray;
@property (nonatomic,retain) NSNumber *rowheight;
@property (nonatomic,retain) UITextField *text;

@end
