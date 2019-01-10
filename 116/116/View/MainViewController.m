//
//  MainViewController.m
//  116
//
//  Created by kd on 2019/1/9.
//  Copyright © 2019 ipc. All rights reserved.
//

#import "MainViewController.h"
#import "LoginViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UIButton *popBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    popBtn.frame = CGRectMake(100, 100, 60, 30);
    popBtn.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:popBtn];
    [popBtn addTarget:self action:@selector(BtnClick) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)BtnClick
{
    LoginViewController *logVc = [[LoginViewController alloc] init];
//    [self.navigationController presentViewController:logVc animated:YES completion:nil];
    [self.navigationController pushViewController:logVc animated:YES];
//    [self.navigationController presentModalViewController:logVc animated:YES];
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
