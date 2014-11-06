//
//  IWNavViewController.m
//  ItcastWeibo
//
//  Created by yz on 14/11/6.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "IWNavViewController.h"

@interface IWNavViewController ()

@end

@implementation IWNavViewController

// 这个方法调用：第一次使用本类或者他的子类会调用
+ (void)initialize
{
    if (self == [IWNavViewController class]) {
        // 设置导航条的标题
        [self setUpNavBarTitle];
        
        // 设置导航条的按钮
        [self setUpNavBarButton];
    }
}

+ (void)setUpNavBarButton
{
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:[IWNavViewController class], nil];
    NSMutableDictionary *normalDictM = [NSMutableDictionary dictionary];
    normalDictM[NSForegroundColorAttributeName] = [UIColor orangeColor];
    // 设置普通状态下的按钮颜色
    [item setTitleTextAttributes:normalDictM forState:UIControlStateNormal];
    
    // 设置不可用状态下的按钮颜色
    NSMutableDictionary *disableDictM = [NSMutableDictionary dictionary];
    disableDictM[NSForegroundColorAttributeName] = [UIColor lightGrayColor];
    [item setTitleTextAttributes:disableDictM forState:UIControlStateDisabled];
}

// 设置导航条的标题
+ (void)setUpNavBarTitle
{
    
    UINavigationBar *nav = [UINavigationBar appearanceWhenContainedIn:[IWNavViewController class], nil];
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[NSFontAttributeName] = IWNavgationBarTitleFont;
    [nav setTitleTextAttributes:dictM];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
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
