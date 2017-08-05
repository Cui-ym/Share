//
//  MynewsViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/31.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "MynewsViewController.h"
#import "CYGuanViewController.h"
#import "CYSixinViewController.h"

@interface MynewsViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *array;
}
@end

@implementation MynewsViewController

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    // 设置标签栏左侧按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 110, 40);
    [back setImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    back.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    [back setTitle:@"我的信息" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    
    // 设置 UITableView
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStyleGrouped];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    array = [NSArray arrayWithObjects:@[@"评论", @"7"], @[@"推荐我的", @"9"], @[@"新关注的", @"5"], @[@"私信", @"4"], @[@"活动通知", @"1"] , nil];
    
    // Do any additional setup after loading the view.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 55;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    UILabel *titlelab = [[UILabel alloc] initWithFrame:CGRectMake(40, 17, 200, 20)];
    titlelab.text = array[indexPath.row][0];
    titlelab.font = [UIFont systemFontOfSize:17];
    [cell.contentView addSubview:titlelab];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(275, 15, 15, 15)];
    image.image = [UIImage imageNamed:@"img3"];
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(295, 17, 50, 15)];
    lab.text = array[indexPath.row][1];
    lab.font = [UIFont systemFontOfSize:15];
    lab.textColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    [cell.contentView addSubview:image];
    [cell.contentView addSubview:lab];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 2){
        CYGuanViewController *view = [[CYGuanViewController alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    } else if (indexPath.row == 3){
        CYSixinViewController *view = [[CYSixinViewController alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    }
}

- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
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
