//
//  PopViewController.m
//  116
//
//  Created by kd on 2018/12/29.
//  Copyright © 2018 ipc. All rights reserved.
//

#import "PopViewController.h"
#import "LHScreenSize.h"
@interface PopViewController ()
{
    UIView *_popview;
}
@end

@implementation PopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _popview = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor blackColor];
    
    _popview.backgroundColor = [UIColor whiteColor];
    _popview.layer.cornerRadius = 8;
    _popview.layer.masksToBounds = YES;
    [self.view addSubview:_popview];
    [_popview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(30*kWidthFactor);
        make.right.equalTo(self.view).offset(-30*kWidthFactor);
        make.top.equalTo(self.view).offset(175*kHeightFactor);
        make.bottom.equalTo(self.view).offset(-265*kHeightFactor);
    }];
    
    //lable
    UILabel *titleLabel = [[UILabel alloc] init];
    titleLabel.text = @"提醒";
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor blackColor];
    [_popview addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self->_popview).offset(8*kHeightFactor);
        make.centerX.equalTo(self->_popview);
        make.size.mas_equalTo(CGSizeMake(74*kWidthFactor, 24*kHeightFactor));
    }];
    //content label
    UILabel *contentLabel = [[UILabel alloc] init];
    contentLabel.text = @"please enter email and password";
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.font = [UIFont systemFontOfSize:14];
    contentLabel.textColor = [UIColor blackColor];
    [_popview addSubview:contentLabel];
    [contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(5*kHeightFactor);
        make.left.right.equalTo(self->_popview);
        make.height.mas_equalTo(40*kHeightFactor);
    }];
    
    //button
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:@"确认" forState:UIControlStateNormal];
    
    btn.backgroundColor = [UIColor blueColor];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_popview addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(40*kHeightFactor);
        make.bottom.equalTo(self->_popview.mas_bottom);
        make.width.equalTo(self->_popview.mas_width);
    }];
    self.confirmBtn = btn;
    
    
   
    
    
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
