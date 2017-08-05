//
//  MysetViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/31.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "MysetViewController.h"
#import "CYZiliaoViewController.h"
#import "CYXiugaiViewController.h"
#import "CYXiaoxiViewController.h"


@interface MysetViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *array;
    UIAlertController *alert;
}
@end

@implementation MysetViewController

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:211/225.0 green:211/225.0 blue:211/225.0 alpha:1];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    // 设置标签栏左侧按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 90, 40);
    [back setImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    back.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    [back setTitle:@"设置" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    
    // 设置 UITableView
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStyleGrouped];
    table.backgroundColor = [UIColor whiteColor];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    array = [NSArray arrayWithObjects:@"基本资料", @"修改密码", @"消息设置", @"关于SHARE", @"清除缓存", nil];
    alert = [UIAlertController alertControllerWithTitle:nil message:@"缓存已清除" preferredStyle:UIAlertControllerStyleAlert];
    // Do any additional setup after loading the view.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
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
    titlelab.text = array[indexPath.row];
    titlelab.font = [UIFont systemFontOfSize:17];
    [cell.contentView addSubview:titlelab];
    UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(275, 15, 15, 15)];
    image.image = [UIImage imageNamed:@"img3"];
    [cell.contentView addSubview:image];
    
   
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        CYZiliaoViewController *view = [[CYZiliaoViewController alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    } else if (indexPath.row == 1){
        CYXiugaiViewController *view = [[CYXiugaiViewController alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    } else if (indexPath.row == 2){
        CYXiaoxiViewController * view= [[CYXiaoxiViewController alloc] init];
        [self.navigationController pushViewController:view animated:YES];
    } else if (indexPath.row == 4){
        [self presentViewController:alert animated:YES completion:nil];
        [self performSelector:@selector(delete) withObject:nil afterDelay:1];
    }
}

- (void)delete{
    [self dismissViewControllerAnimated:YES completion:nil];
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
