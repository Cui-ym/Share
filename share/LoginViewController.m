//
//  LoginViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/25.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "LoginViewController.h"
#import "RegisterViewController.h"
#import "HomeViewController.h"
#import "ActivityViewController.h"
#import "SearchViewController.h"
#import "ArticleViewController.h"
#import "PersonalViewController.h"

@interface LoginViewController ()<UITextFieldDelegate>

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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
    
    // 设置账号输入框
    UITextField *userText = [[UITextField alloc] initWithFrame:CGRectMake(40, 275, 295, 45)];
    userText.delegate = self;
    userText.backgroundColor = [UIColor whiteColor];
    userText.borderStyle = UITextBorderStyleRoundedRect;
    userText.tag = 1001;
    // 设置左侧视图
    UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    UIImageView *userImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 35, 35)];
    userImage.image = [UIImage imageNamed:@"user_img"];
    UIImageView *line = [[UIImageView alloc] initWithFrame:CGRectMake(43, 7, 1, 30)];
    line.image = [UIImage imageNamed:@"line"];
    [leftView addSubview:userImage];
    [leftView addSubview:line];
    userText.placeholder = @"请输入账号";
    userText.clearButtonMode = UITextFieldViewModeWhileEditing;
    userText.leftViewMode = UITextFieldViewModeAlways;
    userText.leftView = leftView;
    [self.view addSubview:userText];
    
    // 设置密码输入框
    UITextField *passwordText = [[UITextField alloc] initWithFrame:CGRectMake(40, 330, 295, 45)];
    passwordText.delegate = self;
    passwordText.backgroundColor = [UIColor whiteColor];
    passwordText.borderStyle = UITextBorderStyleRoundedRect;
    passwordText.tag = 1002;
    [self.view addSubview:passwordText];
    // 设置左侧视图
    UIView *leftView1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 45, 45)];
    UIImageView *passwordImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 35, 35)];
    passwordImage.image = [UIImage imageNamed:@"pass_img"];
    UIImageView *line1 = [[UIImageView alloc] initWithFrame:CGRectMake(43, 7, 1, 30)];
    line1.image = [UIImage imageNamed:@"line"];
    [leftView1 addSubview:passwordImage];
    [leftView1 addSubview:line1];
    passwordText.leftViewMode = UITextFieldViewModeAlways;
    passwordText.leftView = leftView1;
    passwordText.placeholder = @"请输入密码";
    passwordText.secureTextEntry = YES;
    passwordText.clearButtonMode = UITextFieldViewModeWhileEditing;
    
    //添加登陆注册按钮
    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [loginBtn setTitle:@"登陆" forState:UIControlStateNormal];
    loginBtn.layer.masksToBounds = YES;
    loginBtn.layer.cornerRadius = 5;
    loginBtn.layer.borderWidth = 1;
    loginBtn.frame = CGRectMake(75, 405, 100, 35);
    loginBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [loginBtn setTintColor:[UIColor whiteColor]];
    loginBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [loginBtn addTarget:self action:@selector(jumpHome) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:loginBtn];
    
    // 添加注册按钮
    UIButton *registerBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [registerBtn setTitle:@"注册" forState:UIControlStateNormal];
    registerBtn.layer.masksToBounds = YES;
    registerBtn.layer.cornerRadius = 5;
    registerBtn.layer.borderWidth = 1;
    registerBtn.frame = CGRectMake(200, 405, 100, 35);
    registerBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [registerBtn setTintColor:[UIColor whiteColor]];
    registerBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [registerBtn addTarget:self action:@selector(jumpView) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:registerBtn];
    
    // 添加自动登录按钮
    UIButton *automaticBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    automaticBtn.frame = CGRectMake(40, 457, 80, 15);
    [automaticBtn setTitle:@"自动登录" forState:UIControlStateNormal];
    automaticBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [automaticBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    // 设置图片，文字位置
    automaticBtn.imageEdgeInsets = UIEdgeInsetsMake(1, 0, 1, 67);
    automaticBtn.titleEdgeInsets = UIEdgeInsetsMake(2, -20, 2, 0);
    automaticBtn.tag = 1;
    [automaticBtn setImage:[UIImage imageNamed:@"checkbox_unchecked"] forState:UIControlStateNormal];
    [automaticBtn addTarget:self action:@selector(targetBtn) forControlEvents:UIControlEventTouchUpInside];
    [automaticBtn setImage:[UIImage imageNamed:@"checkbox_checked"] forState:UIControlStateSelected];
    automaticBtn.alpha = 0.5;
    [self.view addSubview:automaticBtn];
}

// 跳转至首页
- (void)jumpHome{
    HomeViewController *homeView = [[HomeViewController alloc] init];
    SearchViewController *searchView = [[SearchViewController alloc] init];
    ArticleViewController *articleView = [[ArticleViewController alloc] init];
    ActivityViewController *activityView = [[ActivityViewController alloc] init];
    PersonalViewController *personalView = [[PersonalViewController alloc] init];

    // 设置 NavigationController
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:homeView];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:searchView];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:articleView];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:activityView];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:personalView];
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:0.21 green:0.56 blue:0.80 alpha:0.50]];
    
    NSArray *array1 = [NSArray arrayWithObjects:@"radio_button1_normal", @"radio_button2_normal", @"radio_button3_normal", @"radio_button4_normal", @"radio_button5_normal", nil];
    NSArray *array2 = [NSArray arrayWithObjects:@"radio_button1_pressed", @"radio_button2_pressed", @"radio_button3_pressed", @"radio_button4_pressed", @"radio_button5_pressed", nil];
    
    // 设置 TabBarController
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    tabBarController.viewControllers = [NSArray arrayWithObjects:nav1, nav2, nav3, nav4, nav5, nil];
    int i = 0;
    for (UITabBarItem *item in tabBarController.tabBar.items){
        UIImage *image = [UIImage imageNamed:[array1 objectAtIndex:i]];
        image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.image = image;
        UIImage *selectedimage = [UIImage imageNamed:[array2 objectAtIndex:i]];
        selectedimage = [selectedimage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        item.selectedImage = selectedimage;
        i++;
    }
    tabBarController.tabBar.barTintColor = [UIColor blackColor];
    [self presentViewController:tabBarController animated:YES completion:nil];
}

// 跳转至注册界面
- (void)jumpView{
    RegisterViewController *registerView = [[RegisterViewController alloc] init];
    [self presentViewController:registerView animated:YES completion:nil];
}

// 自动登录按钮，更改selected
- (void)targetBtn{
    UIButton *btn = [self.view viewWithTag:1];
    btn.selected = YES;
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
