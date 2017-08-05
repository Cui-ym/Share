//
//  CYGuanViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/31.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "CYGuanViewController.h"

@interface CYGuanViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    NSArray *array;
}
@end

@implementation CYGuanViewController

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
    [back setTitle:@"新关注的" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    
    UITableView *table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) style:UITableViewStylePlain];
    table.delegate = self;
    table.dataSource = self;
    [self.view addSubview:table];
    
    array = [NSArray arrayWithObjects:@[@"sixin_img1", @"share小格"], @[@"sixin_img2", @"share小兰"], @[@"sixin_img3", @"share小明"], @[@"sixin_img4", @"share小雪"], @[@"guanzhu_img5", @"share萌萌"], @[@"guanzhu_img6", @"sharetLity"], nil];
    // Do any additional setup after loading the view.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 6;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIndentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.imageView.image = [UIImage imageNamed:array[indexPath.row][0]];
    cell.textLabel.text = array[indexPath.row][1];
    
    UIButton *guanBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    guanBtn.frame = CGRectMake(275, 30, 60, 25);
    guanBtn.tag = 1001;
    if (indexPath.row < 4){
        [guanBtn setImage:[UIImage imageNamed:@"guanzhu_pressed"] forState:UIControlStateNormal];
        [guanBtn setImage:[UIImage imageNamed:@"guanzhu_normal"] forState:UIControlStateSelected];
    } else {
        [guanBtn setImage:[UIImage imageNamed:@"guanzhu_pressed"] forState:UIControlStateSelected];
        [guanBtn setImage:[UIImage imageNamed:@"guanzhu_normal"] forState:UIControlStateNormal];
    }
    [guanBtn addTarget:self action:@selector(change:) forControlEvents:UIControlEventTouchUpInside];
    [cell.contentView addSubview:guanBtn];
    
    CGSize itemSize = CGSizeMake(55, 55);//固定图片大小
    UIGraphicsBeginImageContextWithOptions(itemSize, NO, 0.0);//*1
    CGRect imageRect = CGRectMake(0, 0, itemSize.width, itemSize.height);
    [cell.imageView.image drawInRect:imageRect];
    cell.imageView.image = UIGraphicsGetImageFromCurrentImageContext();//*2
    UIGraphicsEndImageContext();
    
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
