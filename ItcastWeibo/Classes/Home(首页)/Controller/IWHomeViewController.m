//
//  IWHomeViewController.m
//  ItcastWeibo
//
//  Created by yz on 14/11/4.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "IWHomeViewController.h"
#import "IWTitleButton.h"
#import "IWPopView.h"
#import "IWPopViewController.h"



@interface IWHomeViewController ()<IWPopViewDelegate>

@property (nonatomic, strong) IWPopView *popView;
@property (nonatomic, weak) IWTitleButton *titleButton;

@property (nonatomic, strong) IWPopViewController *popVc;
@end

@implementation IWHomeViewController
- (IWPopViewController *)popVc
{
    if (_popVc == nil) {
        IWPopViewController *pop = [[IWPopViewController alloc] init];
        _popVc = pop;

    }
    return _popVc;
}
- (IWPopView *)popView
{
    if (_popView == nil) {
        
        IWPopView *v = [IWPopView popView];
        v.delegate = self;
        _popView = v;
    }
    return _popView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 设置导航条的内容
    [self setUpNavBar];
    
}

- (void)setUpNavBar
{
    UIBarButtonItem *friendsearch = [UIBarButtonItem barButtonItemWithImage:@"navigationbar_friendsearch" highImage:@"navigationbar_friendsearch_highlighted" target:self action:@selector(friendsearch)];
    self.navigationItem.leftBarButtonItem = friendsearch;
    
    UIBarButtonItem *pop = [UIBarButtonItem barButtonItemWithImage:@"navigationbar_pop" highImage:@"navigationbar_pop_highlighted" target:self action:@selector(pop)];
    self.navigationItem.rightBarButtonItem = pop;
    
    // 设置titleView
    IWTitleButton *titleButton = [IWTitleButton buttonWithType:UIButtonTypeCustom];
    [titleButton setTitle:@"首页" forState:UIControlStateNormal];
    [titleButton addTarget:self action:@selector(titleClick:) forControlEvents:UIControlEventTouchUpInside];
    _titleButton = titleButton;
    
    self.navigationItem.titleView = titleButton;
    
}

- (void)titleClick:(UIButton *)button
{
    button.selected = !button.selected;
    
    //  显示菜单
    CGFloat x = (self.view.width - 200) * 0.5;
    CGFloat y = CGRectGetMaxY(self.navigationController.navigationBar.frame) - 9;
    
    self.popView.contentView = self.popVc.view;
    
    [self.popView showInRect:CGRectMake(x, y, 200, 200)];
    
}

- (void)popViewDidDismiss:(IWPopView *)popView
{
    _titleButton.selected = NO;
    _popView = nil;
}

- (void)friendsearch
{
    IWLog(@"friendsearch");
//    NSLog(@"friendsearch");
}

- (void)pop
{
    
}



@end
