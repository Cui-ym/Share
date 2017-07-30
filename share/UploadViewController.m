//
//  UploadViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/27.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "UploadViewController.h"
#import "SelectViewController.h"
#import "DropDown.h"
#import "FourView.h"

@interface UploadViewController () <UITextViewDelegate>

@end

@implementation UploadViewController

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
    [back setTitle:@"上传" forState:UIControlStateNormal];
    [back setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:back];
    self.navigationItem.leftBarButtonItem = backItem;
    
    // 设置选择图片按钮
    UIButton *selectImage = [UIButton buttonWithType:UIButtonTypeCustom];
    selectImage.frame = CGRectMake(15, 80, 200, 110);
    [selectImage setTitle:@"选择图片" forState:UIControlStateNormal];
    [selectImage setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [selectImage addTarget:self action:@selector(pushSelectView) forControlEvents:UIControlEventTouchUpInside];
    selectImage.backgroundColor = [UIColor colorWithRed:190/225.0 green:190/225.0 blue:190/225.0 alpha:1];
    selectImage.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.view addSubview:selectImage];
    
    // 设置定位
    UILabel *lab = [[UILabel alloc] initWithFrame:CGRectMake(265, 110, 75, 20)];
    lab.backgroundColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    lab.layer.masksToBounds = YES;
    lab.layer.cornerRadius = 10;
    [self.view addSubview:lab];
    lab.text = @"陕西省,西安市";
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = [UIColor whiteColor];
    lab.font = [UIFont systemFontOfSize:10.5];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(245, 110, 20, 20)];
    imageView.image = [UIImage imageNamed:@"定位"];
    [self.view addSubview:imageView];
    
    // 添加原创作品一栏
    DropDown *dd = [[DropDown alloc] initWithFrame:CGRectMake(245, 145, 110, 30)];
    dd.backgroundColor = [UIColor clearColor];
    NSArray *array = [[NSArray alloc] initWithObjects:@"原创作品", @"设计资料", @"设计师观点", @"设计教程", nil];
    dd.tableArray = array;
    dd.layer.masksToBounds = YES;
    dd.layer.cornerRadius = 2;
    dd.layer.borderWidth = 1;
    dd.layer.borderColor = [UIColor clearColor].CGColor;
    [self.view addSubview:dd];
    
    // 设置分割线
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 205, 375, 2)];
    view.backgroundColor = [UIColor colorWithRed:190/225.0 green:190/225.0 blue:190/225.0 alpha:1];
    [self.view addSubview:view];
    
    // 设置标签
    NSArray *array1 = [NSArray arrayWithObjects:@"平面设计", @"网页设计", @"UI/icon", @"插画/手绘", nil];
    for (int i = 0; i < 4; i++){
        FourView *lab = [[FourView alloc] initWithText:array1[i]];
        lab.frame = CGRectMake(10 * (i + 1) + 80 * i, 225, 80, 30);
        [self.view addSubview:lab];
    }
    UILabel *lab3 = [[UILabel alloc] initWithFrame:CGRectMake(10, 270, 90, 30)];
    lab3.text = @"虚拟与设计";
    lab3.backgroundColor = [UIColor whiteColor];
    lab3.textAlignment = NSTextAlignmentCenter;
    lab3.layer.masksToBounds = YES;
    lab3.layer.cornerRadius = 3;
    lab3.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:lab3];
    UILabel *lab4 = [[UILabel alloc] initWithFrame:CGRectMake(115, 270, 70, 30)];
    lab4.text = @"影视";
    lab4.backgroundColor = [UIColor whiteColor];
    lab4.textAlignment = NSTextAlignmentCenter;
    lab4.layer.masksToBounds = YES;
    lab4.layer.cornerRadius = 3;
    lab4.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:lab4];
    UILabel *lab5 = [[UILabel alloc] initWithFrame:CGRectMake(200, 270, 70, 30)];
    lab5.text = @"摄影";
    lab5.backgroundColor = [UIColor whiteColor];
    lab5.textAlignment = NSTextAlignmentCenter;
    lab5.layer.masksToBounds = YES;
    lab5.layer.cornerRadius = 3;
    lab5.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:lab5];
    UILabel *lab6 = [[UILabel alloc] initWithFrame:CGRectMake(280, 270, 80, 30)];
    lab6.text = @"其他";
    lab6.backgroundColor = [UIColor whiteColor];
    lab6.textAlignment = NSTextAlignmentCenter;
    lab6.layer.masksToBounds = YES;
    lab6.layer.cornerRadius = 3;
    lab6.font = [UIFont systemFontOfSize:16];
    [self.view addSubview:lab6];
    
    // 设置作品名称输入栏
    UITextView *nameText = [[UITextView alloc] initWithFrame:CGRectMake(0, 310, 370, 25)];
    nameText.backgroundColor = [UIColor whiteColor];
    nameText.contentInset = UIEdgeInsetsMake(0, 10, 0, 0);
    nameText.text = @"作品名称";
    nameText.tag = 1001;
    nameText.textColor = [UIColor lightGrayColor];
    nameText.delegate = self;
    [self.view addSubview:nameText];
    // 设置作品描述输入栏
    UITextView *contentText = [[UITextView alloc] initWithFrame:CGRectMake(0, 345, 375, 90)];
    contentText.backgroundColor = [UIColor whiteColor];
    contentText.contentInset = UIEdgeInsetsMake(0, 10, 0, 10);
    contentText.text = @"请添加作品说明/文章内容......";
    contentText.tag = 1002;
    contentText.textColor = [UIColor lightGrayColor];
    contentText.delegate = self;
    [self.view addSubview:contentText];
    
    // 添加发布按钮
    UIButton *releaseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    releaseBtn.frame = CGRectMake(10, 445, 355, 50);
    releaseBtn.backgroundColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    [releaseBtn setTitle:@"发布" forState:UIControlStateNormal];
    releaseBtn.tintColor = [UIColor whiteColor];
    releaseBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    releaseBtn.titleEdgeInsets = UIEdgeInsetsMake(15, 150, 15, 150);
    [self.view addSubview:releaseBtn];
    
    // 设置禁止转发按钮
    UIButton *automaticBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    automaticBtn.frame = CGRectMake(10, 510, 60, 15);
    [automaticBtn setTitle:@"禁止转发" forState:UIControlStateNormal];
    automaticBtn.titleLabel.font = [UIFont systemFontOfSize:11];
    [automaticBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 设置图片，文字位置
    automaticBtn.imageEdgeInsets = UIEdgeInsetsMake(1, 0, 1, 47);
    automaticBtn.titleEdgeInsets = UIEdgeInsetsMake(3, -20, 2, 0);
    automaticBtn.tag = 1;
    [automaticBtn setImage:[UIImage imageNamed:@"checkbox_unchecked"] forState:UIControlStateNormal];
    [automaticBtn addTarget:self action:@selector(targetBtn) forControlEvents:UIControlEventTouchUpInside];
    [automaticBtn setImage:[UIImage imageNamed:@"checkbox_checked"] forState:UIControlStateSelected];
    automaticBtn.alpha = 1;
    [self.view addSubview:automaticBtn];
}

- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pushSelectView{
    SelectViewController *view = [[SelectViewController alloc] init];
    [self.navigationController pushViewController:view animated:YES];
}

- (void)targetBtn{
    UIButton *btn = [self.view viewWithTag:1];
    btn.selected = YES;
}

- (void)textViewDidEndEditing:(UITextView *)textView
{
    UITextView *view1 = [self.view viewWithTag:1001];
    UITextView *view2 = [self.view viewWithTag:1001];
    if(view1.text.length < 1){
        view1.text = @"作品名称";
        view1.textColor = [UIColor grayColor];
    }
    if(view2.text.length < 1){
        view2.text = @"作品名称";
        view2.textColor = [UIColor grayColor];
    }
}
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    UITextView *view1 = [self.view viewWithTag:1001];
    UITextView *view2 = [self.view viewWithTag:1001];
    if([view1.text isEqualToString:@"作品名称"]){
        view1.text=@"";
        view1.textColor=[UIColor blackColor];
    }
    if([view2.text isEqualToString:@"请添加作品说明/文章内容......"]){
        view2.text=@"";
        view2.textColor=[UIColor blackColor];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

// 实现点击空白处以回收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 通过tag值找到对应的text
    UITextField *userText = [self.view viewWithTag:1001];
    UITextField *passwordText = [self.view viewWithTag:1002];
    
    [userText resignFirstResponder];
    [passwordText resignFirstResponder];
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
