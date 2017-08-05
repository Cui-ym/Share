//
//  CYDuihuaViewController.m
//  share
//
//  Created by 崔一鸣 on 2017/7/31.
//  Copyright © 2017年 崔一鸣. All rights reserved.
//

#import "CYDuihuaViewController.h"

#define H [UIScreen mainScreen].bounds.size.height
#define W [UIScreen mainScreen].bounds.size.width

@interface CYDuihuaViewController ()<UITableViewDelegate, UITableViewDataSource>

@end

@implementation CYDuihuaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.21 green:0.56 blue:0.8 alpha:1];
    self.navigationItem.title = @"与share小兰对话";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:18]}];
    // 导航栏左侧按钮
    UIButton *backButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    [backButton setImage:[UIImage imageNamed:@"back_img"] forState:UIControlStateNormal];
    [backButton addTarget:self action:@selector(backClick) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
    self.navigationItem.leftBarButtonItem = backItem;
    
    // 设置输入框
    _text = [[UITextField alloc] initWithFrame:CGRectMake(W * 0.07, W * 0.01, W * 0.75, H * 0.06)];
    _text.borderStyle=UITextBorderStyleRoundedRect;
    
    // 设置发送按钮
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor colorWithRed:69/255.0 green:141/255.0 blue:203/255.0 alpha:1];
    [btn setTitle:@"发送" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(W * 0.82 + W * 0.01, W * 0.01, W * 0.15, H * 0.06);
    btn.layer.borderWidth=1;
    btn.layer.cornerRadius=10;
    
    // 设置输入背景色
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, H - 44 - 64, W, 44)];
    view.backgroundColor=[UIColor blackColor];
    view.tag=101;
    [view addSubview:_text];
    [view addSubview:btn];
    
    // 设置 TableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, W, H - 44 * 2) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_tableView];
    [self.view addSubview:view];
    [self.view bringSubviewToFront:view];
    
    // 设置聊天信息数值
    _messageArray = [NSMutableArray arrayWithObjects:@"你拍的真不错！", @"谢谢，已关注你。", @"好专业的照片，非常喜欢这种风格，期待你更好的作品。", @"嗯嗯，好的。",nil];
    _rowheightArray = [NSMutableArray array];
    for (NSString *str in _messageArray){
        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        CGSize size = [str boundingRectWithSize:CGSizeMake(W * 0.6, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        
        int height = size.height + W * 0.15;
        _rowheight = [NSNumber numberWithInt:height];
        [_rowheightArray addObject:_rowheight];
    }
    
    // 键盘回收事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
    // Do any additional setup after loading the view.
}

// 发送信息，并计算高度
- (void)send{
    [_messageArray addObject:_text.text];
    NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    // 自适应高度，并计算
    CGSize size = [_text.text boundingRectWithSize:CGSizeMake(W * 0.6, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
    int height = size.height + W * 0.15;
    _rowheight = [NSNumber numberWithInt:height];
    [_rowheightArray addObject:_rowheight];
    // 插入一条新的cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(_messageArray.count - 1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    // 更新tableView
    [_tableView reloadData];
    // 滚动界面
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    // 清空 textField
    _text.text = @"";
    
}

// 实现点击空白处以回收键盘
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_text resignFirstResponder];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _messageArray.count;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    } else {
        //删除cell的所有子视图
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // 一人一句话
    if(indexPath.row % 2 != 0){
        // 设置头像
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sixin_img2"]];
        imageView.frame = CGRectMake(W * 0.01, W * 0.05, W * 0.1, W * 0.1);
        [cell.contentView addSubview:imageView];
        
        // 设置聊天气泡
        UIImageView *imageviewbubble = [[UIImageView alloc] init];
        imageviewbubble.backgroundColor = [UIColor colorWithRed:211/225.0 green:211/225.0 blue:211/225.0 alpha:0.5];
//        UIImage *image = [UIImage imageNamed:@"对话框1"];
//        UIEdgeInsets edge = UIEdgeInsetsMake(image.size.height * 0.5, image.size.width * 0.8, image.size.height * 0.8, image.size.width * 0.5);
//        image = [image resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
//        imageviewbubble.image = image;
        
        // 设置对话框
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.text = _messageArray[indexPath.row];
        label.font = [UIFont systemFontOfSize:18];
        NSDictionary* attri = @{NSFontAttributeName:label.font};
        // 自适应高度
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(W * 0.6, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        label.frame = CGRectMake(W * 0.16, W * 0.05, size.width, size.height);
        imageviewbubble.frame = CGRectMake(W * 0.13, W * 0.01, size.width + W * 0.10, size.height + W * 0.10);
        [cell.contentView addSubview:imageviewbubble];
        [cell.contentView addSubview:label];
        
        
    }
    else{
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sixin_img1"]];
        imageView.frame = CGRectMake(W - W * 0.11, W * 0.05, W * 0.1, W * 0.1);
        [cell.contentView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.text = _messageArray[indexPath.row];
        label.font = [UIFont systemFontOfSize:18];
        NSDictionary* attri = @{NSFontAttributeName:label.font};
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(W*0.6, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        
        label.frame = CGRectMake(W - W * 0.14 - size.width, W * 0.05, size.width, size.height);
        
        UIImageView *imageviewbubble = [[UIImageView alloc]init];
        imageviewbubble.backgroundColor = [UIColor colorWithRed:211/225.0 green:211/225.0 blue:211/225.0 alpha:0.5];
//        UIImage *image = [UIImage imageNamed:@"对话框"];
        imageviewbubble.frame = CGRectMake(W * 0.8 - size.width, W * 0.01, size.width + W * 0.08, size.height + W * 0.10);
//        UIEdgeInsets edge = UIEdgeInsetsMake(image.size.height * 0.5, image.size.width*0.5, image.size.height*0.8, image.size.width*0.8);
//        image = [image resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
//        imageviewbubble.image = image;
        [cell.contentView addSubview:imageviewbubble];
        [cell.contentView addSubview:label];
        
    }
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSNumber *height = _rowheightArray[indexPath.row];
    int rowheight = [height intValue];
    return rowheight + W * 0.05;
}

- (void)keyboardWillDisAppear:(NSNotification *)notification{
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height - 64);}];
}

- (void)backClick{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.view endEditing:YES];
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
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
