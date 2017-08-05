//
//  CYSixinViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/31.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "CYSixinViewController.h"
#import "MYSixinCell.h"
#import "CYSixinTableViewCell.h"
#import "CYDuihuaViewController.h"

@interface CYSixinViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *cellArray;
    NSArray *array;
}
@end

@implementation CYSixinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    // 设置标签栏左侧按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 90, 40);
    [back setImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    back.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    [back setTitle:@"私信" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    array = [NSArray arrayWithObjects:@[@"sixin_img1", @"share小格", @"你的作品我很喜欢!!!", @"11-03 09:45"], @[@"sixin_img2", @"share小兰", @"谢谢，以关注你", @"11-03 10:00"], @[@"sixin_img3", @"share小明", @"为你点赞!", @"11-03 10:23"], @[@"sixin_img4", @"share小雪", @"你好可以问问你是怎么拍的吗?", @"11-03 11:20"], nil];
    
    cellArray = [NSMutableArray array];
    
    for (int i = 0; i < 4; i++){
        MYSixinCell *cell = [[MYSixinCell alloc] init];
        cell.image = array[i][0];
        cell.titleLab = array[i][1];
        cell.lab = array[i][2];
        cell.timeLab = array[i][3];
        [cellArray addObject:cell];
    }
    
    // Do any additional setup after loading the view.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 82;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    CYSixinTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[CYSixinTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    MYSixinCell *temp = cellArray[indexPath.row];
    cell.image.image = [UIImage imageNamed:temp.image];
    cell.titleLab.text = temp.titleLab;
    cell.lab.text = temp.lab;
    cell.timeLab.text = temp.timeLab;
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 1){
        CYDuihuaViewController *view = [[CYDuihuaViewController alloc] init];
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
