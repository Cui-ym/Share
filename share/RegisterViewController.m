//
//  RegisterViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/26.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<UITextFieldDelegate>

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 设置背景
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *image = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    image.image = [UIImage imageNamed:@"kaiji1"];
    image.userInteractionEnabled = YES;
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesBegan: withEvent:)];
    [image addGestureRecognizer:tap];
    [self.view addSubview:image];
    
    // 设置 logo
    UIImageView *logoImage = [[UIImageView alloc] initWithFrame:CGRectMake(135, 80, 100, 100)];
    logoImage.image = [UIImage imageNamed:@"login_logo"];
    [image addSubview:logoImage];
    UILabel *logoLab = [[UILabel alloc] initWithFrame:CGRectMake(135, 195, 100, 25)];
    logoLab.text = @"SHARE";
    logoLab.textColor = [UIColor whiteColor];
    logoLab.textAlignment = NSTextAlignmentLeft;
    logoLab.font = [UIFont systemFontOfSize:31];
    [self.view addSubview:logoLab];
    
    // 设置邮箱输入框
    UITextField *mailText = [[UITextField alloc] initWithFrame:CGRectMake(40, 260, 295, 45)];
    mailText.delegate = self;
    mailText.backgroundColor = [UIColor whiteColor];
    mailText.borderStyle = UITextBorderStyleRoundedRect;
    mailText.tag = 1001;
    // 设置左侧视图
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    UIImageView *mailImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 35, 35)];
    mailImage.image = [UIImage imageNamed:@"email_img"];
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(43, 7, 1, 30)];
    line.image = [UIImage imageNamed:@"line"];
    [leftView addSubview:mailImage];
    [leftView addSubview:line];
    mailText.placeholder = @"请输入邮箱号";
    mailText.clearButtonMode = UITextFieldViewModeWhileEditing;
    mailText.leftViewMode = UITextFieldViewModeAlways;
    mailText.leftView = leftView;
    [self.view addSubview:mailText];
    
    // 设置账号输入框
    UITextField *userText = [[UITextField alloc] initWithFrame:CGRectMake(40, 320, 295, 45)];
    userText.delegate = self;
    userText.backgroundColor = [UIColor whiteColor];
    userText.borderStyle = UITextBorderStyleRoundedRect;
    userText.tag = 1002;
    // 设置左侧视图
    UIView *leftView2 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    UIImageView *userImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 35, 35)];
    userImage.image = [UIImage imageNamed:@"user_img"];
    UIImageView *line2 = [[UIImageView alloc] initWithFrame:CGRectMake(43, 7, 1, 30)];
    line2.image = [UIImage imageNamed:@"line"];
    [leftView2 addSubview:userImage];
    [leftView2 addSubview:line2];
    userText.placeholder = @"请输入账号";
    userText.clearButtonMode = UITextFieldViewModeWhileEditing;
    userText.leftViewMode = UITextFieldViewModeAlways;
    userText.leftView = leftView2;
    [self.view addSubview:userText];
    
    // 设置密码输入框
    UITextField *passwordText = [[UITextField alloc] initWithFrame:CGRectMake(40, 380, 295, 45)];
    passwordText.delegate = self;
    passwordText.backgroundColor = [UIColor whiteColor];
    passwordText.borderStyle = UITextBorderStyleRoundedRect;
    passwordText.tag = 1003;
    // 设置左侧视图
    UIView *leftView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    UIImageView *passwordImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 35, 35)];
    passwordImage.image = [UIImage imageNamed:@"pass_img"];
    UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(43, 7, 1, 30)];
    line1.image = [UIImage imageNamed:@"line"];
    [leftView1 addSubview:passwordImage];
    [leftView1 addSubview:line1];
    passwordText.placeholder = @"请输入密码";
    passwordText.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordText.leftViewMode = UITextFieldViewModeAlways;
    passwordText.leftView = leftView1;
    [self.view addSubview:passwordText];
    
    // 添加确认注册按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(120, 475, 135, 35);
    [btn setTitle:@"确认注册" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:20];
    btn.layer.masksToBounds = YES;
    btn.layer.cornerRadius = 5;
    btn.layer.borderWidth = 1;
    btn.layer.borderColor = [UIColor whiteColor].CGColor;
    [btn addTarget:self action:@selector(backView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

}

// 返回登陆界面
- (void)backView{
    [self dismissViewControllerAnimated:YES completion:nil];
}

// 回收键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

// 实现点击空白处以回收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    // 通过tag值找到对应的text
    UITextField *userText = [self.view viewWithTag:1002];
    UITextField *passwordText = [self.view viewWithTag:1003];
    UITextField *emailText = [self.view viewWithTag:1001];
    
    [userText resignFirstResponder];
    [passwordText resignFirstResponder];
    [emailText resignFirstResponder];
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
