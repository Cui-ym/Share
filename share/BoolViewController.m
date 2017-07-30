//
//  BoolViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/25.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "BoolViewController.h"
#import "LoginViewController.h"

@interface BoolViewController ()

@end

@implementation BoolViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    UIImageView *image = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    image.image = [UIImage imageNamed:@"login_1.jpg"];
    [self.view addSubview:image];
    
    // 延时器
    [self performSelector:@selector(pushLoginView) withObject:nil afterDelay:2];
    
}

- (void)pushLoginView{
    LoginViewController *loginVeiw = [[LoginViewController alloc] init];

    [self presentViewController:loginVeiw animated:NO completion:nil];
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
