//
//  CYZiliaoViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/31.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "CYZiliaoViewController.h"

@interface CYZiliaoViewController ()<UITableViewDataSource, UITableViewDelegate>
{
    NSArray *array;
}
@end

@implementation CYZiliaoViewController

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
    [back setTitle:@"基本资料" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 295) style:UITableViewStylePlain];
    table.backgroundColor = [UIColor whiteColor];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    array = [NSArray arrayWithObjects:@"头像", @"昵称", @"签名", @"性别", @"邮箱", nil];
    
    // Do any additional setup after loading the view.
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0){
        return 95;
    }
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    UILabel *lab = [[UILabel alloc] init];
    lab.text = array[indexPath.row];
    lab.font = [UIFont systemFontOfSize:15];
    if (indexPath.row == 0){
        lab.frame = CGRectMake(40, 40, 35, 15);
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(100, 12, 70, 70)];
        image.image = [UIImage imageNamed:@"sixin_img1"];
        [cell.contentView addSubview:image];
    } else {
        lab.frame = CGRectMake(40, 17, 35, 15);
        if (indexPath.row == 1){
            UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 17, 275, 15)];
            lab1.text = @"share小白";
            lab1.font = [UIFont systemFontOfSize:15];
            [cell.contentView addSubview:lab1];
        } else if (indexPath.row == 2){
            UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 17, 275, 15)];
            lab1.text = @"开心了就笑，不开心了就过会儿再笑";
            lab1.font = [UIFont systemFontOfSize:15];
            [cell.contentView addSubview:lab1];
        } else if (indexPath.row == 3){
            UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
            btn1.frame = CGRectMake(100, 15, 40, 20);
            [btn1 setImage:[UIImage imageNamed:@"boy_button"] forState:UIControlStateNormal];
            [btn1 setTitle:@"男" forState:UIControlStateNormal];
            btn1.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 25);
            btn1.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 2);
            [btn1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
            btn2.frame = CGRectMake(170, 15, 40, 20);
            [btn2 setImage:[UIImage imageNamed:@"girl_button"] forState:UIControlStateNormal];
            btn2.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 25);
            [btn2 setTitle:@"女" forState:UIControlStateNormal];
            btn2.titleEdgeInsets = UIEdgeInsetsMake(0, -25, 0, 2);
            [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [cell.contentView addSubview:btn1];
            [cell.contentView addSubview:btn2];
        } else if (indexPath.row == 4){
            UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(100, 17, 275, 15)];
            lab1.text = @"186####3@qq.com";
            lab1.font = [UIFont systemFontOfSize:15];
            [cell.contentView addSubview:lab1];
        }
    }
    [cell.contentView addSubview:lab];
    return cell;
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
