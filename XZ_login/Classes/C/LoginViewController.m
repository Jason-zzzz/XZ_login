//
//  LoginViewController.m
//  AllView
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "ZZLabel.h"
#import "ZZNavigationViewController.h"

#define INPUT_BACK_VIEW_CORNERWIDTH 48.0

@interface LoginViewController () <UITextFieldDelegate> {
    RegisterViewController * rvc;
    ForgetVerifyCodeViewController * fvc;
}

@property (nonatomic, strong) UIButton * loginButton;
@property (nonatomic, strong) UIView * idInputBackView;
@property (nonatomic, strong) UIView * pswInputBackView;
@property (nonatomic, strong) CircleButton * qqLogin;
@property (nonatomic, strong) CircleButton * wxLogin;
@property (nonatomic, strong) CircleButton * weiboLogin;
@property (nonatomic, strong) UILabel * otherLabel;
@property (nonatomic, strong) ZZLabel * signUPLabel;
@property (nonatomic, strong) ZZLabel * forgetLabel;
@property (nonatomic, strong) UITextField * idInputView;
@property (nonatomic, strong) UITextField * pswInputView;

@end

@implementation LoginViewController

- (instancetype)init {
    if (self = [super init]) {
        self = [LoginViewController initView:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [ZZTools setShadow:self.zzNavigationBar width:5 cornerRadius:5];
    self.zzNavigationBar.zzBackgroundColor = [UIColor clearColor];
     
    [self.view addSubview:self.idInputBackView];
    [self.view addSubview:self.pswInputBackView];
    [self.idInputBackView addSubview:self.idInputView];
    [self.pswInputBackView addSubview:self.pswInputView];
    
    [self.view addSubview:self.otherLabel];
    [self.view addSubview:self.signUPLabel];
    [self.view addSubview:self.forgetLabel];
    
    [self.view addSubview:self.qqLogin];
    [self.view addSubview:self.weiboLogin];
    [self.view addSubview:self.wxLogin];
    
    self.view.layer.masksToBounds = YES;
     
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    self->rvc = [[RegisterViewController alloc] init];
    self->fvc = [[ForgetVerifyCodeViewController alloc] init];
}

#pragma mark 所有frame都需要在这里设置，设置之后再
- (void)viewWillLayoutSubviews {
    
    self.idInputBackView.ct_size = CGSizeMake(100, INPUT_BACK_VIEW_CORNERWIDTH);
    [self.idInputBackView fillWidth:0.8];
    [self.idInputBackView topInContainerRatio:0.3 shouldResize:NO];
    [ZZTools setShadow:_idInputBackView width:5 cornerRadius:INPUT_BACK_VIEW_CORNERWIDTH/2];
    [ZZTools setCornerRadius:_idInputBackView width:INPUT_BACK_VIEW_CORNERWIDTH/2];

    self.pswInputBackView.ct_height = INPUT_BACK_VIEW_CORNERWIDTH;
    [self.pswInputBackView fillWidth:0.8];
    [self.pswInputBackView top:15 FromView:self.idInputBackView];
    [ZZTools setShadow:_pswInputBackView width:5 cornerRadius:INPUT_BACK_VIEW_CORNERWIDTH/2];
    [ZZTools setCornerRadius:_pswInputBackView width:INPUT_BACK_VIEW_CORNERWIDTH/2];
    
    [self.idInputView fillWidth:0.7];
    [self.idInputView fillHeight];
    [self.idInputView fillHeight];
    [self.pswInputView fillWidth:0.7];
    [self.pswInputView fillHeight];
    [self.pswInputView fillHeight];
    
    self.otherLabel.ct_size = CGSizeMake(120, 40);
    [self.otherLabel top:60 FromView:self.pswInputBackView];
    [self.otherLabel centerXEqualToView:self.pswInputBackView];
    
    CGFloat bw = 50;
    self.wxLogin.ct_size = CGSizeMake(bw, bw);
    [self.wxLogin top:20 FromView:self.otherLabel];
    self.wxLogin.ct_centerX = self.view.bounds.size.width/2.;
    
    self.qqLogin.ct_size = CGSizeMake(bw, bw);
    [self.qqLogin centerYEqualToView:self.wxLogin];
    [self.qqLogin right:50 FromView:self.wxLogin];
    
    self.weiboLogin.ct_size = CGSizeMake(bw, bw);
    [self.weiboLogin centerYEqualToView:self.wxLogin];
    [self.weiboLogin left:50 FromView:self.wxLogin];
    
    self.signUPLabel.ct_size = CGSizeMake(200, 40);
    [self.signUPLabel top:15 FromView:self.wxLogin];
    [self.signUPLabel centerXEqualToView:self.wxLogin];

    self.forgetLabel.ct_size = CGSizeMake(120, 80);
    [self.forgetLabel bottomEqualToView:self.view];
    [self.forgetLabel centerXEqualToView:self.wxLogin];
    
    
//    UILabel * placeholderLabel = [[UILabel alloc] init];
//    [_idInputBackView addSubview:placeholderLabel];
//    placeholderLabel.ct_size = CGSizeMake(0, _idInputBackView.ct_height);
//    [placeholderLabel fillWidth:0.8];
//    [placeholderLabel topInContainerRatio:0 shouldResize:NO];
//    placeholderLabel.text = @"请输入账号/手机号";
//    placeholderLabel.textAlignment = NSTextAlignmentCenter;
//    placeholderLabel.textColor = [UIColor colorWithWhite:0.8 alpha:1];
//    placeholderLabel.font = [UIFont systemFontOfSize:17 weight:0.05];
//
//    UILabel * placeholderLabel2 = [[UILabel alloc] init];
//    [_pswInputBackView addSubview:placeholderLabel2];
//    placeholderLabel2.ct_size = CGSizeMake(0, _idInputBackView.ct_height);
//    [placeholderLabel2 fillWidth:0.8];
//    [placeholderLabel2 topInContainerRatio:0 shouldResize:NO];
//    placeholderLabel2.text = @"请输入密码";
//    placeholderLabel2.textAlignment = NSTextAlignmentCenter;
//    placeholderLabel2.textColor = [UIColor colorWithWhite:0.8 alpha:1];
//    placeholderLabel2.font = [UIFont systemFontOfSize:17 weight:0.05];
    
    [self needFrameSetting];
}

#pragma mark 需要frame设置之后才能进行的设置
- (void)needFrameSetting {
    
    [self setImageWithName:@"loginback1" backImageName:@"loginback2"];
    
#pragma mark 跳转注册
    _signUPLabel.text = @"尚未拥有账号？点击注册";
    [_signUPLabel zzSetText:_signUPLabel.text withClickBlock:^(NSString *text) {
        [self.navigationController pushViewController:self->rvc animated:YES];
    }];
#pragma mark 跳转忘记
    _forgetLabel.text = @"  忘记密码？";
    [_forgetLabel zzSetText:_forgetLabel.text withClickBlock:^(NSString *text) {
        [self.navigationController pushViewController:self->fvc animated:YES];
    }];
}
 
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self.view endEditing:YES];
    return YES;
}


#pragma mark - getters and setters

- (UITextField *)idInputView {
    if (_idInputView == nil) {
        _idInputView = [[UITextField alloc] init];
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;
        NSAttributedString *attri  = [[NSAttributedString alloc] initWithString:@"请输入账号/手机号" attributes:@{NSForegroundColorAttributeName:ZZ_COMMON_GRAY,NSFontAttributeName:[UIFont systemFontOfSize:18], NSParagraphStyleAttributeName:style}];
        _idInputView.attributedPlaceholder = attri;
        
        _idInputView.textAlignment = NSTextAlignmentCenter;
        _idInputView.font = [UIFont systemFontOfSize:18];
        _idInputView.textColor = [UIColor grayColor];
        _pswInputView.delegate = self;
        
    }
    _idInputView.tintColor = [UIColor lightGrayColor];
//    [[UITextField appearance] setTintColor:[UIColor blackColor]];
    return _idInputView;
}

- (UITextField *)pswInputView {
    if (_pswInputView == nil) {
        _pswInputView = [[UITextField alloc] init];
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;
        NSAttributedString *attri  = [[NSAttributedString alloc] initWithString:@"请输入密码" attributes:@{NSForegroundColorAttributeName:ZZ_COMMON_GRAY,NSFontAttributeName:[UIFont systemFontOfSize:18], NSParagraphStyleAttributeName:style}];
        _pswInputView.attributedPlaceholder = attri;
        
        _pswInputView.textAlignment = NSTextAlignmentCenter;
        _pswInputView.font = [UIFont systemFontOfSize:18];
        _pswInputView.textColor = [UIColor grayColor];
        _pswInputView.secureTextEntry = YES;
        _pswInputView.delegate = self;
    }
    _pswInputView.tintColor = [UIColor lightGrayColor];
    return _pswInputView;
} 

- (UILabel *)forgetLabel {
    if (_forgetLabel == nil) {
        
        _forgetLabel = [[ZZLabel alloc] init];
        
        _forgetLabel.ruleArray = (NSMutableArray<NSString*> *)@[@"  忘记密码？"];
        _forgetLabel.userInteractionEnabled = YES;
        _forgetLabel.zzNormalColor = ZZ_COMMON_GRAY;
        _forgetLabel.zzHighColor = ZZ_COMMON_ORANGE;
        _forgetLabel.zzSelectedColor = [UIColor lightGrayColor];
        
        _forgetLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        _forgetLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _forgetLabel;
}

- (ZZLabel *)signUPLabel {
    if (_signUPLabel == nil) {
        _signUPLabel = [[ZZLabel alloc] init];
        
        _signUPLabel.ruleArray = (NSMutableArray<NSString*> *)@[@"点击注册"];
        _signUPLabel.userInteractionEnabled = YES;
        _signUPLabel.zzNormalColor = ZZ_COMMON_GRAY;
        _signUPLabel.zzHighColor = ZZ_COMMON_ORANGE;
        _signUPLabel.zzSelectedColor = [UIColor lightGrayColor];
        
        _signUPLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightRegular];
        _signUPLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _signUPLabel;
}

- (UILabel *)otherLabel {
    if (_otherLabel == nil) {
        _otherLabel = [[UILabel alloc] init];
        _otherLabel.text = @"其他登录方式";
        _otherLabel.backgroundColor = [UIColor clearColor];
        _otherLabel.textColor = ZZ_COMMON_GRAY;
        _otherLabel.font = [UIFont systemFontOfSize:16 weight:UIFontWeightLight];
        _otherLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _otherLabel;
}

- (CircleButton *)qqLogin {
    if (_qqLogin == nil) {
        _qqLogin = [[CircleButton alloc] init];
        [_qqLogin setImage:IMAGE_NAME(@"qqLogin") forState:UIControlStateNormal];
    }
    return _qqLogin;
}

- (CircleButton *)wxLogin {
    if (_wxLogin == nil) {
        _wxLogin = [[CircleButton alloc] init];
        [_wxLogin setImage:IMAGE_NAME(@"wxLogin") forState:UIControlStateNormal];
    }
    return _wxLogin;
}

- (CircleButton *)weiboLogin {
    if (_weiboLogin == nil) {
        _weiboLogin = [[CircleButton alloc] init];
        [_weiboLogin setImage:IMAGE_NAME(@"wbLogin") forState:UIControlStateNormal];
    }
    return _weiboLogin;
}

- (UIView *)idInputBackView
{
    if (_idInputBackView == nil) {
        _idInputBackView = [[UIView alloc] init];
        _idInputBackView.backgroundColor = [UIColor whiteColor];
    }
    return _idInputBackView;
}

- (UIView *)pswInputBackView
{
    if (_pswInputBackView == nil) {
        _pswInputBackView = [[UIView alloc] init];
        _pswInputBackView.backgroundColor = [UIColor whiteColor];
    }
    return _pswInputBackView;
}

@end
