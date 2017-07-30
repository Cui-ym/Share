//
//  TabBarController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/26.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "TabBarController.h"
#import "HomeViewController.h"
#import "ActivityViewController.h"
#import "SearchViewController.h"
#import "ArticleViewController.h"
#import "PersonalViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupTheLine];
    [self initialConttrollers];
    
}

// 初始化
- (void)initialConttrollers{
    [self setupController:[[HomeViewController alloc]init] image:@"radio_button1_normal" selectedImage:@"icon_home_pressed.png" title:nil];
    [self setupController:[[SearchViewController alloc]init] image:@"radio_button2_normal" selectedImage:@"" title:nil];
    [self setupController:[[ArticleViewController alloc]init] image:@"radio_button3_normal" selectedImage:@"icon_home_pressed.png" title:nil];
    [self setupController:[[ActivityViewController alloc]init] image:@"radio_button4_normal" selectedImage:@"icon_home_pressed.png" title:nil];
    [self setupController:[[PersonalViewController alloc]init] image:@"radio_button5_normal" selectedImage:@"icon_home_pressed.png" title:nil];
}

// 设置控制器
- (void)setupController:(UIViewController *)view image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title{
    
    // 标题
    view.title = title;
    
    // tabBarImage 照片
    view.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    view.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    // tabBarItem 字体设置
    //正常状态
    NSMutableDictionary *normalText = [NSMutableDictionary dictionary];
    normalText[NSForegroundColorAttributeName] = [UIColor colorWithRed:123/255.0 green:123/255.0 blue:123/255.0 alpha:1.0];
    [view.tabBarItem setTitleTextAttributes:normalText forState:UIControlStateNormal];
    
    //选中状态
    NSMutableDictionary *selectedText = [NSMutableDictionary dictionary];
    selectedText[NSForegroundColorAttributeName] = [UIColor blackColor];
    [view.tabBarItem setTitleTextAttributes:selectedText forState:UIControlStateSelected];
    
    UINavigationController *nav =[[UINavigationController alloc] initWithRootViewController:view];
    [self addChildViewController:nav];
    
}

//设置分割线
-(void)setupTheLine {
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, -8, self.tabBar.frame.size.width, self.tabBar.frame.size.height)];
    [imageView setImage:[UIImage imageNamed:@"bg_tabbar"]];
    [imageView setContentMode:UIViewContentModeCenter];
    [self.tabBar insertSubview:imageView atIndex:0];
    //覆盖原生Tabbar的上横线
    [[UITabBar appearance] setShadowImage:[self createImageWithColor:[UIColor clearColor]]];
    [[UITabBar appearance] setBackgroundImage:[self createImageWithColor:[UIColor clearColor]]];
    //设置TintColor
    //    UITabBar.appearance.tintColor = [UIColor orangeColor];
    
}

-(UIImage*) createImageWithColor:(UIColor*) color
{
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}


//设置中间按钮不受TintColor影响
- (void)awakeFromNib {
    [super awakeFromNib];
    NSArray *items =  self.tabBar.items;
    //设置第几个 tabBar不受影响
    UITabBarItem *btnAdd = items[1];
    btnAdd.image = [btnAdd.image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    btnAdd.selectedImage = [btnAdd.selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
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
