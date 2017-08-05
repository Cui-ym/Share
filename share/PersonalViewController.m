//
//  PersonalViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/26.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "PersonalViewController.h"
#import "UserTableViewCell.h"
#import "MyView.h"
#import "MyuploadViewController.h"
#import "MynewsViewController.h"
#import "MysetViewController.h"
#import "MycommendViewController.h"

@interface PersonalViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *array;
}
@end

@implementation PersonalViewController

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor colorWithRed:211/225.0 green:211/225.0 blue:211/225.0 alpha:1];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:21]}];
    self.navigationItem.title = @"个人信息";
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 40, 40);
    [back setImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    self.navigationController.navigationBar.translucent = NO;
    
    // 设置 tableView
    UITableView *tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 145, 375, 522) style:UITableViewStyleGrouped];
    tableview.backgroundColor = [UIColor whiteColor];
    tableview.delegate = self;
    tableview.dataSource = self;
    [self.view addSubview:tableview];
    
    MyView *view = [[MyView alloc] initWithFrame:CGRectMake(0, 0, 375, 135)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    array = [NSMutableArray arrayWithObjects:@[@"img2", @"我的上传"], @[@"img4", @"我的信息"], @[@"button_zan", @"我推荐的"], @[@"img5", @"院系通知"], @[@"img6", @"设置"], @[@"img7", @"退出"], nil];
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

// 设置 cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UserTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell){
        cell = [[UserTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    cell.image.image = [UIImage imageNamed:array[indexPath.row][0]];
    cell.lab.text = array[indexPath.row][1];
    
    return cell;
}

// 设置每个 cell 的跳转界面
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        MyuploadViewController *view = [[MyuploadViewController alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    } else if (indexPath.row == 1){
        MynewsViewController *view = [[MynewsViewController alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    } else if (indexPath.row == 2){
        MycommendViewController *view = [[MycommendViewController alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    } else if (indexPath.row == 4){
        MysetViewController *view = [[MysetViewController alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    }

}

// 设置高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
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
