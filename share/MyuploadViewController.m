//
//  MyuploadViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/31.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "MyuploadViewController.h"
#import "MyTableViewCell.h"
#import "HomeCell.h"

@interface MyuploadViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *cellArray;
}
@end

@implementation MyuploadViewController

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}

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
    [back setTitle:@"我的上传" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    
    // 设置 TableView
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 30, 355, 637) style:UITableViewStyleGrouped];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
   
    NSArray *arr = [NSArray arrayWithObjects:
                    @[@"list_img1", @"匆匆那年", @"share小白", @"原创/摄影/练习写作", @"15分钟前"],
                    @[@"note_img1", @"关于设计反馈的5件事", @"share小白", @"设计文章-原创-理论", @"16分钟前"],
                    @[@"note_img2", @"用户设计PK战!脸书VS人人", @"share小白", @"设计文章-原创-Web/Flash", @"17分钟前"],
                    @[@"note_img3", @"字体故事", @"share小白", @"设计文章-经验-设计观点", @"18分钟前"], nil];
    cellArray = [NSMutableArray array];
    
    for (int i = 0; i < 4; i++){
        int j = 0;
        HomeCell *cell = [[HomeCell alloc] init];
        cell.titleImageView = [[arr objectAtIndex:i] objectAtIndex:j++];
        cell.titleLab = [[arr objectAtIndex:i] objectAtIndex:j++];
        cell.writerLab = [[arr objectAtIndex:i] objectAtIndex:j++];
        cell.subtitleLab = [[arr objectAtIndex:i] objectAtIndex:j++];
        cell.timeLab = [[arr objectAtIndex:i] objectAtIndex:j++];
        [cellArray addObject:cell];
    }
    
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return cellArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 125;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell) {
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    HomeCell *temp = [cellArray objectAtIndex:indexPath.section];
    cell.titleImageView.image = [UIImage imageNamed:temp.titleImageView];
    cell.titleLab.text = temp.titleLab;
    cell.writerLab.text = temp.writerLab;
    cell.subtitleLab.text = temp.subtitleLab;
    cell.timeLab.text = temp.timeLab;
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
