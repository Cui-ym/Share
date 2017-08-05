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

@interface ArticleViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>
{
    NSMutableArray *cellArray;
    
}

@end

@implementation ArticleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:211/225.0 green:211/225.0 blue:211/225.0 alpha:1];
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
    @[@"note_img1", @"关于设计反馈的5件事", @"share小白", @"设计文章-原创-理论", @"15分钟前"],
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
    
    // 设置 UIScrollView
    _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, self.view.frame.origin.y + 50, 375, 550)];
    _scrollView.contentSize = CGSizeMake(375 * 3, 550);
    _scrollView.delegate = self;
    _scrollView.pagingEnabled = YES;
    _scrollView.scrollEnabled = NO;
    _scrollView.bounces = YES;
    _scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:_scrollView];
    
    // 设置 tableView
    _tableView1 = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, 355, 500) style:UITableViewStyleGrouped];
    _tableView1.delegate = self;
    _tableView1.dataSource = self;
    [self.scrollView addSubview:_tableView1];
    
    _tableView2 = [[UITableView alloc] initWithFrame:CGRectMake(375 + 10, 0, 355, 500) style:UITableViewStyleGrouped];
    _tableView2.delegate = self;
    _tableView2.dataSource = self;
    [self.scrollView addSubview:_tableView2];
    
    _tableView3 = [[UITableView alloc] initWithFrame:CGRectMake(375 * 2 + 10, 0, 355, 500) style:UITableViewStyleGrouped];
    _tableView3.delegate = self;
    _tableView3.dataSource = self;
    [self.scrollView addSubview:_tableView3];
    
    // 设置 segmentControl
    NSArray *array = @[@"精选文章", @"精选文章", @"全部文章"];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:array];
    segmentControl.frame = CGRectMake(0, 64, 375, 40);
    segmentControl.selectedSegmentIndex = 2;
    segmentControl.tintColor = [UIColor whiteColor];
    segmentControl.momentary = NO;
    // 设置颜色
    [segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:16]}
                                  forState:UIControlStateNormal];
    [segmentControl setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:16]}
                                  forState:UIControlStateSelected];
    [segmentControl setBackgroundColor:[UIColor grayColor]];
    [segmentControl addTarget:self action:@selector(doSomethingInSegment:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmentControl];
    
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
    } else {
        //删除cell的所有子视图
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    HomeCell *temp = [cellArray objectAtIndex:indexPath.section];
    cell.titleImageView.image = [UIImage imageNamed:temp.titleImageView];
    cell.titleLab.text = temp.titleLab;
    cell.writerLab.text = temp.writerLab;
    cell.subtitleLab.text = temp.subtitleLab;
    cell.timeLab.text = temp.timeLab;
    return cell;
}

-(void)doSomethingInSegment:(UISegmentedControl *)Seg
{
    _scrollView.frame = CGRectMake(0, 125, 375, 590);
    NSInteger Index = Seg.selectedSegmentIndex;
    switch (Index) {
        case 0:
            [_scrollView scrollRectToVisible:CGRectMake(0, 0, 375, 550) animated:YES];
            break;
        case 1:
            [_scrollView scrollRectToVisible:CGRectMake(375, 0, 375, 550) animated:YES];
            break;
        case 2:
            [_scrollView scrollRectToVisible:CGRectMake(375 * 2, 0, 375, 550) animated:YES];
            break;
    }
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
