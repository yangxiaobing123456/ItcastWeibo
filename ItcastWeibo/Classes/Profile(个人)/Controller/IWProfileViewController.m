//
//  IWProfileViewController.m
//  ItcastWeibo
//
//  Created by yz on 14/11/4.
//  Copyright (c) 2014年 iThinker. All rights reserved.
//

#import "IWProfileViewController.h"

@interface IWProfileViewController ()

@end

@implementation IWProfileViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *setting = [[UIBarButtonItem alloc] initWithTitle:@"设置" style:UIBarButtonItemStyleBordered target:self action:@selector(setting)];
    
    self.navigationItem.rightBarButtonItem = setting;
}

- (void)setting
{
    IWLog(@"设置");
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
