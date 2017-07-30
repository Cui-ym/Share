//
//  SearchViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/26.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "SearchViewController.h"
#import "UploadViewController.h"
#import "LabelView.h"
#import "FourView.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:211/225.0 green:211/225.0 blue:211/225.0 alpha:1];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    self.navigationItem.title = @"搜索";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:21]}];
    // 导航栏左侧按钮
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [backButton setImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    // 导航栏右侧
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(pushClick)];
    
    // 搜索栏
    UISearchBar *search = [[UISearchBar alloc] initWithFrame:CGRectMake(10, 74, 355, 50)];
    search.backgroundImage = [[UIImage alloc] init];
    search.barTintColor = [UIColor whiteColor];
    [self.view addSubview:search];
    
    // 标签
    LabelView *lab1 = [[LabelView alloc] initWithLabel:@"分类"];
    lab1.backgroundColor = [UIColor colorWithRed:60/225.0 green:125/225.0 blue:185/215.0 alpha:1];
    lab1.frame = CGRectMake(10, 135, 75, 25);
    [self.view addSubview:lab1];
    LabelView *lab2 = [[LabelView alloc] initWithLabel:@"推荐"];
    lab2.backgroundColor = [UIColor colorWithRed:60/225.0 green:125/225.0 blue:185/215.0 alpha:1];
    lab2.frame = CGRectMake(10, 265, 75, 25);
    [self.view addSubview:lab2];
    LabelView *lab3 = [[LabelView alloc] initWithLabel:@"时间"];
    lab3.backgroundColor = [UIColor colorWithRed:60/225.0 green:125/225.0 blue:185/215.0 alpha:1];
    lab3.frame = CGRectMake(10, 355, 75, 25);
    [self.view addSubview:lab3];
    // 标签下横线
    UIImageView *line1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background_main"]];
    line1.frame = CGRectMake(10, 158, 355, 2);
    UIImageView *line2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background_main"]];
    line2.frame = CGRectMake(10, 288, 355, 2);
    UIImageView *line3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"background_main"]];
    line3.frame = CGRectMake(10, 378, 355, 2);
    [self.view addSubview:line1];
    [self.view addSubview:line2];
    [self.view addSubview:line3];
    
    NSArray *array = [NSArray arrayWithObjects:@[@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘"], @[@"人气最高", @"收藏最多", @"评论最多", @"编辑精选"], @[@"30分钟前", @"1小时前", @"1月前", @"1年前"], nil];
    // 设置文本
    for (int i = 0; i < 12; i++){
        FourView *lab = [[FourView alloc] initWithText:array[i / 4][i % 4]];
        if (i < 4){
            lab.frame = CGRectMake(10 * (i + 1) + 80 * i, 170, 80, 30);
        } else if (i < 8){
            lab.frame = CGRectMake(10 * (i - 3) + 80 * (i - 4), 300, 80, 30);
        } else {
            lab.frame = CGRectMake(10 * (i - 7) + 80 * (i - 8), 390, 80, 30);
        }
        [self.view addSubview:lab];
    }
    
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 215, 90, 30)];
    lab.text = @"虚拟与设计";
    lab.backgroundColor = [UIColor whiteColor];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.layer.masksToBounds = YES;
    lab.layer.cornerRadius = 3;
    lab.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:lab];
    UILabel *lab4 = [[UILabel alloc] initWithFrame:CGRectMake(115, 215, 70, 30)];
    lab4.text = @"影视";
    lab4.backgroundColor = [UIColor whiteColor];
    lab4.textAlignment = NSTextAlignmentCenter;
    lab4.layer.masksToBounds = YES;
    lab4.layer.cornerRadius = 3;
    lab4.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:lab4];
    UILabel *lab5 = [[UILabel alloc] initWithFrame:CGRectMake(200, 215, 70, 30)];
    lab5.text = @"摄影";
    lab5.backgroundColor = [UIColor whiteColor];
    lab5.textAlignment = NSTextAlignmentCenter;
    lab5.layer.masksToBounds = YES;
    lab5.layer.cornerRadius = 3;
    lab5.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:lab5];
    UILabel *lab6 = [[UILabel alloc] initWithFrame:CGRectMake(280, 215, 80, 30)];
    lab6.text = @"其他";
    lab6.backgroundColor = [UIColor whiteColor];
    lab6.textAlignment = NSTextAlignmentCenter;
    lab6.layer.masksToBounds = YES;
    lab6.layer.cornerRadius = 3;
    lab6.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:lab6];
    
    // Do any additional setup after loading the view.
}

- (void)pushClick{
    UploadViewController *uploadView = [[UploadViewController alloc] init];
    [self.navigationController pushViewController:uploadView animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
