//
//  IWTabBarController.m
//  ItcastWeibo
//
//  Created by yz on 14/11/4.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "IWTabBarController.h"

#import "IWHomeViewController.h"
#import "IWMessageViewController.h"
#import "IWDiscoverViewController.h"
#import "IWProfileViewController.h"
#import "IWNavViewController.h"

#import "IWTabBar.h"


@interface IWTabBarController ()<IWTabBarDelegate>

@property (nonatomic, weak) IWTabBar *customTabBar;

@end

@implementation IWTabBarController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 1.自定义tabBar
    [self setUpTabBar];
    
    // 2.添加子控制器
    [self setUpAllChildViewController];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    // 删除系统自带的tabBarButton
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if (![tabBarButton isKindOfClass:[IWTabBar class]]) {
            [tabBarButton removeFromSuperview];
        }
    }
}
// 设置tabBar
- (void)setUpTabBar
{
    IWTabBar *tabBar = [[IWTabBar alloc] init];
    
    tabBar.frame = self.tabBar.bounds;
    
    tabBar.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"tabbar_background"]];
    
    tabBar.delegate = self;
    
    [self.tabBar addSubview:tabBar];
    
    _customTabBar = tabBar;
    
}

// 添加所有子控制器
- (void)setUpAllChildViewController
{
    // 首页
    IWHomeViewController *home = [[IWHomeViewController alloc] init];
    home.view.backgroundColor = [UIColor whiteColor];
    [self setUpOneChildViewController:home title:@"首页" imageName:@"tabbar_home" selImageName:@"tabbar_home_selected"];
    
    
    // 消息
    IWMessageViewController *message = [[IWMessageViewController alloc] init];
    [self setUpOneChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selImageName:@"tabbar_message_center_selected"];
    message.view.backgroundColor = [UIColor greenColor];
    
    
    // 广场
    IWDiscoverViewController *discover = [[IWDiscoverViewController alloc] init];
    discover.view.backgroundColor = [UIColor blueColor];
    [self setUpOneChildViewController:discover title:@"广场" imageName:@"tabbar_discover" selImageName:@"tabbar_discover_selected"];
    
    
    // 我
    IWProfileViewController *profile = [[IWProfileViewController alloc] init];
    profile.view.backgroundColor = [UIColor yellowColor];
    [self setUpOneChildViewController:profile title:@"我" imageName:@"tabbar_profile" selImageName:@"tabbar_profile_selected"];
    
}

// 添加一个控制器的属性
- (void)setUpOneChildViewController:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selImageName:(NSString *)selImageName
{
    vc.title = title;
    
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    UIImage *selImage = [UIImage imageNamed:selImageName];
    if (iOS7) {
        selImage = [selImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    vc.tabBarItem.badgeValue = @"10";
    
    vc.tabBarItem.selectedImage = selImage;
    
    IWNavViewController *nav = [[IWNavViewController alloc] initWithRootViewController:vc];
    
    [self addChildViewController:nav];
    
    [self.customTabBar addTabBarButtonWithItem:vc.tabBarItem];
    
}

// IWTabBar代理方法
- (void)tabBar:(IWTabBar *)tabBar didSelectedIndex:(NSInteger)selectedIndex
{
    self.selectedIndex = selectedIndex;
}






@end
