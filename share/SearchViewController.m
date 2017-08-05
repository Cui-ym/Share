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
#import "FourBtn.h"

@interface SearchViewController ()<UITextFieldDelegate>

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
    search.tag = 1001;
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
        FourBtn *btn = [[FourBtn alloc] initWithText:array[i / 4][i % 4]];
        [btn addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
        if (i < 4){
            btn.frame = CGRectMake(10 * (i + 1) + 80 * i, 170, 80, 30);
        } else if (i < 8){
            btn.frame = CGRectMake(10 * (i - 3) + 80 * (i - 4), 300, 80, 30);
        } else {
            btn.frame = CGRectMake(10 * (i - 7) + 80 * (i - 8), 390, 80, 30);
        }
        [self.view addSubview:btn];
    }
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(10, 215, 90, 30);
    [btn setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    btn.backgroundColor = [UIColor whiteColor];
//    btn.textAlignment = NSTextAlignmentCenter;
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 3;
//    btn.font = [UIFont systemFontOfSize:16];
    [btn addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    UIButton *btn4 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn4.frame = CGRectMake(115, 215, 70, 30);
    [btn4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn4 addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
    [btn4 setTitle:@"影视" forState:UIControlStateNormal];
    [btn4 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
//    btn4.text = @"影视";
    btn4.backgroundColor = [UIColor whiteColor];
//    btn4.textAlignment = NSTextAlignmentCenter;
    btn4.layer.masksToBounds = YES;
    btn4.layer.cornerRadius = 3;
//    btn4.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:btn4];
    UIButton *btn5 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn5.frame = CGRectMake(200, 215, 70, 30);
    [btn5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn5 addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
    [btn5 setTitle:@"摄影" forState:UIControlStateNormal];
    [btn5 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
//    btn5.text = @"摄影";
    btn5.backgroundColor = [UIColor whiteColor];
//    btn5.textAlignment = NSTextAlignmentCenter;
    btn5.layer.masksToBounds = YES;
    btn5.layer.cornerRadius = 3;
//    btn5.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:btn5];
    UIButton *btn6 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn6.frame = CGRectMake(280, 215, 80, 30);
    [btn6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn6 addTarget:self action:@selector(selected:) forControlEvents:UIControlEventTouchUpInside];
    [btn6 setTitle:@"其他" forState:UIControlStateNormal];
    [btn6 setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
//    btn6.text = @"其他";
    btn6.backgroundColor = [UIColor whiteColor];
//    btn6.textAlignment = NSTextAlignmentCenter;
    btn6.layer.masksToBounds = YES;
    btn6.layer.cornerRadius = 3;
//    btn6.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:btn6];
    
    // Do any additional setup after loading the view.
}

- (void)selected:(UIButton *)btn{
    if (btn.selected == NO){
        btn.backgroundColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
        btn.selected = YES;
    } else {
        btn.selected = NO;
        btn.backgroundColor = [UIColor whiteColor];
    }
}

// 实现点击空白处以回收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 通过tag值找到对应的text
    UITextField *userText = [self.view viewWithTag:1001];
    
    [userText resignFirstResponder];
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
