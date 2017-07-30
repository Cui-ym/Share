//
//  WorksViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/27.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "WorksViewController.h"

@interface WorksViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation WorksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    self.navigationItem.title = @"SHARE";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:21]}];
    
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    //设置UIButton的图像
    [backButton setImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backItemClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    
    self.view.backgroundColor = [UIColor whiteColor];
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height + 50) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    tableView.bounces = NO;
    [self.view addSubview:tableView];
    
    
    // Do any additional setup after loading the view.
}

- (void)backItemClick{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0){
        return 0.1;
    }
    return 0.5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.5;
}



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        return 75;
    }
    return 1240;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.section == 0){
        cell.imageView.image = [UIImage imageNamed:@"sixin_img1"];
        cell.textLabel.text = @"假日";
        cell.textLabel.font = [UIFont systemFontOfSize:20];
        cell.detailTextLabel.text = @"share小白";
        cell.detailTextLabel.font = [UIFont systemFontOfSize:15];
        UILabel *timer = [[UILabel alloc] initWithFrame:CGRectMake(300, 20, 55, 10)];
        timer.text = @"15分钟前";
        timer.font = [UIFont systemFontOfSize:11];
        timer.textAlignment = NSTextAlignmentRight;
        [cell.contentView addSubview:timer];
        
        // 设置三按钮
        self.btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
        [cell.contentView addSubview:self.btn1];
        self.btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
        [cell.contentView addSubview:self.btn2];
        self.btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
        [cell.contentView addSubview:self.btn3];
        self.btn1.frame = CGRectMake(210, 50, 45, 15);
        self.btn2.frame = CGRectMake(265, 50, 45, 15);
        self.btn3.frame = CGRectMake(325, 50, 45, 15);
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
    } else {
        UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 355, 10)];
        lab.text = @"多希望列车能把我带到有你的城市。";
        lab.font = [UIFont systemFontOfSize:15];
        UIImageView *image1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img1"]];
        UIImageView *image2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img2"]];
        UIImageView *image3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img4"]];
        UIImageView *image4 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img3"]];
        UIImageView *image5 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"works_img5"]];
        image1.frame = CGRectMake(10, 35, 355, 200);
        image2.frame = CGRectMake(10, 240, 355, 200);
        image3.frame = CGRectMake(10, 445, 355, 200);
        image4.frame = CGRectMake(85, 650, 200, 290);
        image5.frame = CGRectMake(85, 940, 200, 290);
        [cell.contentView addSubview:lab];
        [cell.contentView addSubview:image1];
        [cell.contentView addSubview:image2];
        [cell.contentView addSubview:image3];
        [cell.contentView addSubview:image4];
        [cell.contentView addSubview:image5];
    }
    
    return cell;
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
