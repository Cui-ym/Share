//
//  SelectViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/28.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "SelectViewController.h"
#import "MyCollectionViewCell.h"

@interface SelectViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation SelectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.backgroundColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    // 设置标签栏左侧按钮
    UIButton *back = [UIButton buttonWithType:UIButtonTypeCustom];
    back.frame = CGRectMake(0, 0, 110, 40);
    [back setImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    back.imageEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 10);
    [back setTitle:@"选择照片" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    
    // 设置标签栏右侧按钮
    UIButton *uploadBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    uploadBtn.frame = CGRectMake(0, 0, 55, 25);
    [uploadBtn setTitle:@"上传" forState:UIControlStateNormal];
    [uploadBtn addTarget:self action:@selector(uploadImage) forControlEvents:UIControlEventTouchUpInside];
    uploadBtn.tintColor = [UIColor whiteColor];
    uploadBtn.layer.masksToBounds = YES;
    uploadBtn.layer.cornerRadius = 5;
    uploadBtn.layer.borderWidth = 1;
    uploadBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    UIBarButtonItem *uploadItem = [[UIBarButtonItem alloc] initWithCustomView:uploadBtn];
    self.navigationItem.rightBarButtonItem = uploadItem;
    
    // 设置UICollectionView
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(120, 120);
    layout.minimumLineSpacing = 5;
    layout.minimumInteritemSpacing = 5;
    layout.sectionInset = UIEdgeInsetsMake(5, 0, 5, 0);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView *cv = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, 375, 667) collectionViewLayout:layout];
    cv.delegate = self;
    cv.dataSource = self;
    cv.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:cv];
    // 注册cell
    [cv registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    // Do any additional setup after loading the view.
}

- (void)uploadImage{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"确定上传所选内容" message:nil preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *cencelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:cencelAction];
    // 这里新建了一个带有警示性的选项
    UIAlertAction *yesAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDestructive handler:nil];
    [alert addAction:yesAction];
    [self presentViewController:alert animated:YES completion:nil];
}


- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    _cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell"  forIndexPath:indexPath];
    _cell.imageView.image = [UIImage imageNamed:@"myImg"];
    
    return _cell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 30;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
    cell.imageView.image = [UIImage imageNamed:@"myImg(1)"];
    if (cell.select == NO){
        cell.select = YES;
        cell.imageView.image = [UIImage imageNamed:@"myImg"];
    } else {
        cell.select = NO;
        cell.imageView.image = [UIImage imageNamed:@"myImg(1)"];
    }
}

//- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
//    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    cell.imageView.image = [UIImage imageNamed:@"myImg"];
//}

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
