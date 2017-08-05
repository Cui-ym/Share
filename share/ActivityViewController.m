//
//  ActivityViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/26.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "ActivityViewController.h"

@interface ActivityViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation ActivityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:211/225.0 green:211/225.0 blue:211/225.0 alpha:1];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:21]}];
    self.navigationItem.title = @"活动";
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 40, 40);
    [back setImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, 355, 677) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 175;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    if (indexPath.section == 0){
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 355, 175)];
        image.image = [UIImage imageNamed:@"活动1"];
        [cell.contentView addSubview:image];
    } else if(indexPath.section == 1){
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 355, 175)];
        image.image = [UIImage imageNamed:@"活动2"];
        [cell.contentView addSubview:image];
    } else {
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 355, 175)];
        image.image = [UIImage imageNamed:@"活动3"];
        [cell.contentView addSubview:image];
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
