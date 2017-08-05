//
//  CYXiaoxiViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/31.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "CYXiaoxiViewController.h"

@interface CYXiaoxiViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *array;
}
@end

@implementation CYXiaoxiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:211/225.0 green:211/225.0 blue:211/225.0 alpha:1];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    // 设置标签栏左侧按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 110, 40);
    [back setImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    back.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    [back setTitle:@"消息设置" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
    table.backgroundColor = [UIColor whiteColor];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    array = [NSArray arrayWithObjects:@"接收新消息通知", @"通知显示栏", @"声音", @"震动", @"关注更新", nil];
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, 200, 20)];
    textLabel.text = array[indexPath.row];
    textLabel.font = [UIFont systemFontOfSize:17];
    [cell.contentView addSubview:textLabel];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:@"my_button_pressed"] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"my_button_normal"] forState:UIControlStateSelected];
    [btn addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(273, 15, 17, 17);
    [cell.contentView addSubview:btn];
    
    return cell;
    
}

- (void)change:(UIButton *)btn{
    if (btn.selected == NO){
        btn.selected = YES;
    } else {
        btn.selected = NO;
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
