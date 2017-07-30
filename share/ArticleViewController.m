//
//  ArticleViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/26.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "ArticleViewController.h"
#import "MyTableViewCell.h"
#import "HomeCell.h"

@interface ArticleViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSMutableArray *cellArray;
}
@end

@implementation ArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    // 设置标题栏
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    [back setImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    back.frame = CGRectMake(0, 0, 40, 40);
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    self.navigationItem.title = @"文章";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:21]}];
    
    NSArray *arr = [NSArray arrayWithObjects:
    @[@"note_img2", @"关于设计反馈的5件事", @"share小白", @"设计文章-原创-理论", @"15分钟前"],
    @[@"note_img2", @"用户设计PK战!脸书VS人人", @"share小王", @"设计文章-原创-Web/Flash", @"16分钟前"],
    @[@"note_img3", @"字体故事", @"share小吕", @"设计文章-经验-设计观点", @"17分钟前"],
    @[@"note_img4", @"格式整理术：高效解决多风格要求", @"share小王", @"设计文章-经验-案例分析", @"18分钟前"], nil];
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
    
    // 设置 tableView
    // UITableView *tableView = [UITableView alloc] initWithFrame:CGRectMake(10, 30, 355, <#CGFloat height#>) style:<#(UITableViewStyle)#>
    
    // Do any additional setup after loading the view.
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
