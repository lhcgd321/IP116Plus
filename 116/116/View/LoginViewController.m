//
//  LoginViewController.m
//  116
//
//  Created by kd on 2018/12/29.
//  Copyright © 2018 ipc. All rights reserved.
//

#import "LoginViewController.h"
#import "PopViewController.h"
#import "LHScreenSize.h"
#import "RegisterViewController.h"

#define LHImage(name) [UIImage imageNamed:name]

@interface LoginViewController ()<UITextFieldDelegate, UINavigationController>
{
    UIButton *_LoginBtn;
    UIButton *_remberBtn;
    UIButton *_register;
    UIButton *_confirmBtn;
    PopViewController *_popVc;
    UITextField *_emailTextField;
    UITextField *_passWordTextField;
    UIButton *_telMvBtn;
    UIButton *_emailrightBtn;
    LoginViewController *_logVc;
}


@end
//搭界面
@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //iconImageView
    UIImageView *iconVc = [[UIImageView alloc] initWithFrame:CGRectMake(100*kWidthFactor, 100*kHeightFactor, 100*kWidthFactor, 200*kHeightFactor)];
    iconVc.image = [UIImage imageNamed:@"logo_ip1166"];
    [self.view addSubview:iconVc];
    [iconVc mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(92*kHeightFactor);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(64*kWidthFactor, 64*kHeightFactor));
    }];
    
    //lable
    UILabel *titleLabel = [[UILabel alloc] init];
    [self.view addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconVc.mas_bottom).offset(10*kHeightFactor);
        make.centerX.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100*kWidthFactor, 35*kHeightFactor));
    }];
    titleLabel.text = @"高清网络摄像机";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont systemFontOfSize:14.0];
    
    //登录邮箱的View
    UIView *logEmailView = [[UIView alloc] init];
    logEmailView.backgroundColor = [UIColor grayColor];
    
    [self.view addSubview:logEmailView];
    [logEmailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(45*kHeightFactor);
        make.left.equalTo(self.view).offset(15*kWidthFactor);
        make.right.equalTo(self.view).offset(-15*kWidthFactor);
        make.bottom.equalTo(titleLabel.mas_bottom).offset(156*kHeightFactor);
    }];
    //MARK:- 邮箱的设置
    _emailTextField = [[UITextField alloc] init];
    //    emailTextField.backgroundColor = [UIColor redColor];
    [logEmailView addSubview:_emailTextField];
    [_emailTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(45*kHeightFactor);
        make.left.equalTo(self.view).offset(15*kWidthFactor);
        make.right.equalTo(self.view).offset(-15*kWidthFactor);
        make.bottom.equalTo(titleLabel.mas_bottom).offset(100*kHeightFactor);
    }];
   
    _emailTextField.delegate = self;
    _emailTextField.placeholder = @"邮箱";
    _emailTextField.textColor = [UIColor blackColor];
    _emailTextField.font = [UIFont systemFontOfSize:14];
    _emailTextField.borderStyle = UITextBorderStyleRoundedRect;
    _emailTextField.backgroundColor = [UIColor grayColor];
    _emailTextField.textAlignment = NSTextAlignmentCenter;
    //email rightBtn
    //设置textField 的 rightView属性和 rightViewMode的属性
    
    _emailrightBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 40)];
    _emailTextField.rightView = _emailrightBtn;
    _emailTextField.rightViewMode = UITextFieldViewModeAlways;
    //监听事件
    [_emailrightBtn addTarget:self action:@selector(emailRightBtnClick) forControlEvents:UIControlEventTouchUpInside];
   

    [_emailTextField addTarget:self action:@selector(EndEding) forControlEvents:UIControlEventEditingDidEnd];
        
    [_emailTextField addTarget:self action:@selector(Begineding) forControlEvents:UIControlEventEditingDidBegin];
    
    
   
    
    
    
    
    
    
    //MARK:- 分割线的设置
    UIView *lineView = [[UIView alloc] init];
    lineView.backgroundColor = [UIColor blackColor];
    [logEmailView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(100*kHeightFactor);
        make.left.equalTo(self.view).offset(25*kWidthFactor);
        make.right.equalTo(self.view).offset(-25*kWidthFactor);
        make.bottom.equalTo(titleLabel.mas_bottom).offset(101*kHeightFactor);
    }];
    //MARK:- 密码的设置
    //密码输入
    _passWordTextField = [[UITextField alloc] init];
    //    PassWordTextField.backgroundColor = [UIColor redColor];
    [logEmailView addSubview:_passWordTextField];
    [_passWordTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(101*kHeightFactor);
        make.left.equalTo(self.view).offset(15*kWidthFactor);
        make.right.equalTo(self.view).offset(-15*kWidthFactor);
        make.bottom.equalTo(titleLabel.mas_bottom).offset(156*kHeightFactor);
    }];
    
    _passWordTextField.placeholder = @"密码";
    _passWordTextField.textColor = [UIColor blackColor];
    _passWordTextField.font = [UIFont systemFontOfSize:14];
    _passWordTextField.textAlignment = NSTextAlignmentCenter;
    _passWordTextField.keyboardType =  UIKeyboardTypeASCIICapable;
    _passWordTextField.returnKeyType = UIReturnKeyDone;
//    PassWordTextField.clearButtonMode = UITextFieldViewModeAlways;
//    _passWordTextField.secureTextEntry = YES;
    _passWordTextField.delegate = self;
    //rightView
    _telMvBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 30, 40)];
    [_telMvBtn setImage:LHImage(@"icon_eye_on") forState:UIControlStateNormal];
    [_telMvBtn setImage:LHImage(@"icon_eye_off") forState:UIControlStateSelected];
    [_telMvBtn addTarget:self action:@selector(telImvClick) forControlEvents:UIControlEventTouchUpInside];
    //设置textField 的 rightView属性和 rightViewMode的属性
    _passWordTextField.rightView = _telMvBtn;
    _passWordTextField.rightViewMode = UITextFieldViewModeAlways;
  
    
//    UIView *VC = [[UIView alloc] init];
//    [_passWordTextField addSubview:VC];
//    [VC mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.right.bottom.equalTo(self->_passWordTextField);
//        make.width.mas_equalTo(30*kWidthFactor);
//    }];
//    _telMvBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//    [VC addSubview:_telMvBtn];
//    [_telMvBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.bottom.top.equalTo(VC);
//    }];
//    [_telMvBtn setImage:LHImage(@"icon_eye_on") forState:UIControlStateNormal];
//        [_telMvBtn setImage:LHImage(@"icon_eye_off") forState:UIControlStateSelected];
//        [_telMvBtn addTarget:self action:@selector(telImvClick) forControlEvents:UIControlEventTouchUpInside];
//
//    UIButton *eYesBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 30, 20)];
//    _passWordTextField.rightView = eYesBtn;
//
//    telImv.backgroundColor = [UIColor redColor];
//    [eYesBtn setImage:LHImage(@"icon_eye_on") forState:UIControlStateNormal];
//    [eYesBtn setImage:LHImage(@"icon_eye_off") forState:UIControlStateSelected];

    //登录button
    _LoginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [_LoginBtn addTarget:self action:@selector(loginBtnClickDown) forControlEvents:UIControlEventTouchDown];
    [_LoginBtn addTarget:self action:@selector(loginBtnClickUp) forControlEvents:UIControlEventTouchUpInside];
    
    _LoginBtn.backgroundColor = [UIColor whiteColor];
    [_LoginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_LoginBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.view addSubview:_LoginBtn];
    [_LoginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(176*kHeightFactor);
        make.left.equalTo(self.view).offset(15*kWidthFactor);
        make.right.equalTo(self.view).offset(-15*kWidthFactor);
        make.bottom.equalTo(titleLabel.mas_bottom).offset(221*kHeightFactor);
    }];
    
    //记住密码
    _remberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_remberBtn];
    [_remberBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(236*kHeightFactor);
        make.left.equalTo(self.view).offset(15*kWidthFactor);
        make.size.mas_equalTo(CGSizeMake(100*kWidthFactor, 30*kHeightFactor));
    }];
    
    [_remberBtn setImage:LHImage(@"icon_remenber_off") forState:UIControlStateNormal];
    [_remberBtn setImage:LHImage(@"icon_remenber_on") forState:UIControlStateSelected];
    [_remberBtn addTarget:self action:@selector(remberBtn) forControlEvents:UIControlEventTouchUpInside];
    _remberBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 60*kHeightFactor);
    [_remberBtn setTitle:@"记住密码" forState:UIControlStateNormal];
    
    
    //注册
    _register = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.view addSubview:_register];
    [_register mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLabel.mas_bottom).offset(236*kHeightFactor);
        make.right.equalTo(self.view).offset(-15*kWidthFactor);
        make.size.mas_equalTo(CGSizeMake(40*kWidthFactor, 30*kHeightFactor));
    }];
    [_register setTitle:@"注册" forState:UIControlStateNormal];
    
    [_register addTarget:self action:@selector(registerBtnClick) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

//textfield的代理方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    return [textField resignFirstResponder];
}

- (void)Begineding
{
     [_emailrightBtn setImage:LHImage(@"history_video_no") forState:UIControlStateNormal];
}
- (void)EndEding
{
    [_emailrightBtn setImage:LHImage(@" ") forState:UIControlStateNormal];
}

- (void)emailRightBtnClick
{
    _emailTextField.text = nil;
}



- (void)registerBtnClick
{
    RegisterViewController *registerVc = [[RegisterViewController alloc] init];
   
    
    
}

- (void)telImvClick{
    _telMvBtn.selected = !_telMvBtn.selected;
    if (_telMvBtn.selected) {
        _passWordTextField.secureTextEntry = YES;
    }else if (!_telMvBtn.selected){
        _passWordTextField.secureTextEntry = NO;
    }
    
}



- (void)remberBtn
{
    _remberBtn.selected = !_remberBtn.selected;
}

- (void)loginBtnClickDown
{
    _LoginBtn.backgroundColor = [UIColor grayColor];
    if (_emailTextField.text.length == 0 && _passWordTextField.text.length ==0) {
        _popVc = [[PopViewController alloc] init];
        [self.view addSubview:_popVc.view];
    }
 
    [_popVc.confirmBtn addTarget:self action:@selector(confirmBtnClick) forControlEvents:UIControlEventTouchUpInside];
}
- (void)confirmBtnClick
{
    [_popVc.view removeFromSuperview];
    
}

- (void)loginBtnClickUp
{
    _LoginBtn.backgroundColor = [UIColor whiteColor];
    
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
