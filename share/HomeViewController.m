//
//  HomeViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/26.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeCell.h"
#import "MyTableViewCell.h"
#import "WorksViewController.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate>

{
    NSMutableArray *cellArray;
}

@end

@implementation HomeViewController

- (void)viewWillAppear:(BOOL)animated{
    
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:211/225.0 green:211/225.0 blue:211/225.0 alpha:1];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    self.navigationItem.title = @"SHARE";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:21]}];
    
    // 设置 UITableView
    UITableView *tab = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, 355, self.view.frame.size.height - 10 ) style:UITableViewStyleGrouped];
    tab.delegate = self;
    tab.dataSource = self;
    tab.bounces = NO;
    [self.view addSubview:tab];
    
    // 设置cell
    NSArray *array = [NSArray arrayWithObjects:@[@"list_img1", @"假日", @"share小白", @"原创-插画-联系写作", @"15分钟前"],
  @[@"list_img2", @"国外画册欣赏", @"share小王", @"平面设计-海报设计", @"16分钟前"],
  @[@"list_img3", @"collection扁平设计", @"share小吕", @"平面设计-海报设计", @"17分钟前"],
  @[@"list_img4", @"板式整理术：高效解决多风格要求", @"share小王", @"原创-插画-联系写作", @"18分钟前"], nil];
    
    cellArray = [NSMutableArray array];
    
    for (int i = 0; i < 4; i++){
        int j = 0;
        HomeCell *cell = [[HomeCell alloc] init];
        cell.titleImageView = [[array objectAtIndex:i] objectAtIndex:j++];
        cell.titleLab = [[array objectAtIndex:i] objectAtIndex:j++];
        cell.writerLab = [[array objectAtIndex:i] objectAtIndex:j++];
        cell.subtitleLab = [[array objectAtIndex:i] objectAtIndex:j++];
        cell.timeLab = [[array objectAtIndex:i] objectAtIndex:j++];
        [cellArray addObject:cell];
    }
    
}

// 头标题高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0){
        return 0.1;
    }
    return 5;
}

// 尾标题高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 4)
        return 0.1;
    return 5;
}

// cell 高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0){
        return 180;
    } else {
        return 125;
    }
}

// section 个数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}

// 每个 section 的 row 个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

// 点击 cell 执行的方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1){
        WorksViewController *worksView = [[WorksViewController alloc] init];
        [self.navigationController pushViewController:worksView animated:YES];
        self.tabBarController.tabBar.hidden = YES;
    }
    
}

// 设置 cell
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    MyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell){
        cell = [[MyTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    if (indexPath.section == 0){
        UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
        // 设置 scrollView
        NSArray *array = [NSArray arrayWithObjects:@"main_img4", @"main_img1", @"main_img2", @"main_img3", @"main_img4", @"main_img1", nil];
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 355, 180)];
        _scrollView.contentSize = CGSizeMake(355 * 6, 180);
        [cell.contentView addSubview:_scrollView];
        _scrollView.delegate = self;
        _scrollView.pagingEnabled = YES;
        _scrollView.bounces = YES;
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        // 加载图片
        for (int i = 0; i < 6; i++){
            UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[array objectAtIndex:i]]];
            imageView.frame = CGRectMake(355 * i, 0, 355, 180);
            [_scrollView addSubview:imageView];
        }
        // 设置 pageControl
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 150, 355, 30)];
        _pageControl.numberOfPages = 4;
        _pageControl.currentPage = 0;
        [_pageControl addTarget:self action:@selector(pageTurn:) forControlEvents:UIControlEventValueChanged];
        [cell.contentView addSubview:_pageControl];
        // 设置定时器
        _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(pageChanged:) userInfo:nil repeats:YES];
        // 取得主循环
        NSRunLoop *mainLoop = [NSRunLoop mainRunLoop];
        [mainLoop addTimer:_timer forMode:NSRunLoopCommonModes];
        return cell;
    } else {
        HomeCell *temp = [cellArray objectAtIndex:indexPath.section - 1];
        cell.titleImageView.image = [UIImage imageNamed:temp.titleImageView];
        cell.titleLab.text = temp.titleLab;
        cell.writerLab.text = temp.writerLab;
        cell.subtitleLab.text = temp.subtitleLab;
        cell.timeLab.text = temp.timeLab;
    }
    
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    // 更新当前页
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    
    if (offset.x < 355){
        _pageControl.currentPage = 3;
        [_scrollView scrollRectToVisible:CGRectMake(355 * 4, 0, 355, 180) animated:NO];
    } else if (offset.x > 355 * 4){
        _pageControl.currentPage = 0;
        [_scrollView scrollRectToVisible:CGRectMake(355, 0, 355, 180) animated:NO];
    } else {
        _pageControl.currentPage = offset.x / bounds.size.width - 1;
    }
    
    // 重新设置定时器
    _timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(pageChanged:) userInfo:nil repeats:YES];
    NSRunLoop *mainLoop = [NSRunLoop mainRunLoop];
    [mainLoop addTimer:_timer forMode:NSRunLoopCommonModes];
    
}

- (void)pageChanged:(id)sender{
    //- (void)pageChanged:(id)sender{
    
    // 获取当前索引
    NSInteger currentPage = _pageControl.currentPage;
    // 获取当前偏移量
    CGPoint offset = _scrollView.contentOffset;
    
    if (currentPage == 3){
        currentPage = 0;
        offset.x = 355;
    } else {
        currentPage++;
        offset.x += 355;
    }
    _pageControl.currentPage = currentPage;
    CGRect rect = CGRectMake(offset.x, offset.y, 355, 180);
    [_scrollView scrollRectToVisible:rect animated:YES];
    
}

// 点击圆点翻页
- (void)pageTurn:(UIPageControl *)sender{
    CGSize viewSize = _scrollView.frame.size;
    CGRect ract = CGRectMake(sender.currentPage * viewSize.width, 0, viewSize.width, viewSize.height);
    [_scrollView scrollRectToVisible:ract animated:YES];
}

// 设置开始拖拽时，计时器停止；
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    
    //关闭定时器
    [_timer invalidate];
    _timer = nil;
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
