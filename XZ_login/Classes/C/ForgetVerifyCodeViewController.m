//
//  ForgetVerifyCodeViewController.m
//  XZ_login
//
//  Created by apple on 2019/4/19.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "ForgetVerifyCodeViewController.h"

#define REGIS_BACK_VIEW_CORNERWIDTH 40.0
#define ASSURE_BACK_VIEW_CORNERWIDTH 30.0
#define VERIFY_BACK_VIEW_CORNERWIDTH 10.0
#define INPUT_BACK_VIEW_CORNERWIDTH 40.0

@interface ForgetVerifyCodeViewController ()

@property (nonatomic, strong) ZZButton * assureButton;
@property (nonatomic, strong) ZZButton * verifyCodeButton;
@property (nonatomic, strong) UIView * registerTextfieldBackView;
@property (nonatomic, strong) UIView * idInputBackView;
@property (nonatomic, strong) UIView * pswInputBackView;
@property (nonatomic, strong) UITextField * idInputView;
@property (nonatomic, strong) UITextField * pswInputView;
@property (nonatomic, strong) StepProgressView * stepView;
@property (nonatomic, strong) UIView * lineViewa;
@property (nonatomic, strong) UIView * lineViewp;

@end

@implementation ForgetVerifyCodeViewController

- (instancetype)init {
    if (self = [super init]) {
        self = [ForgetVerifyCodeViewController initView:self];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.registerTextfieldBackView];
    self.assureButton = [[[ZZButton alloc] init] initWithText:@"下一步" color:ZZ_COMMON_ORANGE corner:0 selector:@selector(assureRegister) actionController:self];
    [self.view addSubview:self.assureButton];
    
    
    // 初始化进度条
    _stepView = [[StepProgressView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) titlesArray:@[@"", @""] stepIndex:0];
    [self.registerTextfieldBackView addSubview:_stepView];
    
    [self.registerTextfieldBackView addSubview:self.idInputBackView];
    [self.registerTextfieldBackView addSubview:self.pswInputBackView];
    [self.idInputBackView addSubview:self.idInputView];
    [self.idInputBackView addSubview:self.lineViewa];
    [self.pswInputBackView addSubview:self.pswInputView];
    [self.pswInputBackView addSubview:self.lineViewp];
    
    self.verifyCodeButton = [[[ZZButton alloc] init] initWithText:@"获取验证码" color:ZZ_COMMON_ORANGE corner:0 selector:@selector(getVerifyCode) actionController:self];
    [self.pswInputBackView addSubview:self.verifyCodeButton];
    
    self.idInputView.keyboardType = UIKeyboardTypeNumberPad;
    //    self.pswInputView.keyboardType = UIKeyboardTypeNumberPad;
    
    self.zzNavigationBar.zzBackgroundColor = [UIColor clearColor];
    
    [self addNotification]; // 键盘遮挡检测
}

#pragma mark 所有frame都需要在这里设置
- (void)viewWillLayoutSubviews {
    
    self.idInputBackView.ct_size = CGSizeMake(100, INPUT_BACK_VIEW_CORNERWIDTH);
    [self.idInputBackView fillWidth:0.8];
    [self.idInputBackView topInContainerRatio:0.35 shouldResize:NO];
    //    [ZZTools setShadow:_idInputBackView width:5 cornerRadius:INPUT_BACK_VIEW_CORNERWIDTH/2];
    //    [ZZTools setCornerRadius:_idInputBackView width:INPUT_BACK_VIEW_CORNERWIDTH/2];
    
    self.pswInputBackView.ct_height = INPUT_BACK_VIEW_CORNERWIDTH;
    [self.pswInputBackView fillWidth:0.5];
    [self.pswInputBackView top:10 FromView:self.idInputBackView];
    //    [ZZTools setShadow:_pswInputBackView width:5 cornerRadius:INPUT_BACK_VIEW_CORNERWIDTH/2];
    //    [ZZTools setCornerRadius:_pswInputBackView width:INPUT_BACK_VIEW_CORNERWIDTH/2];
    
    [self.stepView fillWidth];
    self.stepView.ct_height = 80;
    self.stepView.ct_top = 30;
    [self.stepView setProgressViewHeight:6];
    
    CGFloat apWidth = 0.9;
    [self.idInputView fillWidth:apWidth];
    [self.idInputView fillHeight];
    [self.idInputView fillHeight];
    [self.lineViewa fillWidth:apWidth];
    self.lineViewa.ct_height = 0.5;
    [self.lineViewa top:0 FromView:self.idInputView];
    
    [self.pswInputView fillWidth:apWidth];
    [self.pswInputView fillHeight];
    [self.pswInputView fillHeight];
    [self.pswInputView leftEqualToView:self.idInputView];
    [self.lineViewp fillWidth:apWidth];
    self.lineViewp.ct_height = 0.5;
    [self.lineViewp top:0 FromView:self.pswInputView];
    [self.lineViewp leftEqualToView:self.idInputView];
    [self.verifyCodeButton fillWidth:0.45];
    [self.verifyCodeButton fillHeight:0.75];
    self.verifyCodeButton.titleLabel.font = [UIFont systemFontOfSize:11];
    [self.verifyCodeButton rightEqualToView:self.idInputView];
    [ZZTools setCornerRadius:self.verifyCodeButton width:VERIFY_BACK_VIEW_CORNERWIDTH/2];
    
    [self.registerTextfieldBackView fillHeight:0.35];
    [self.registerTextfieldBackView fillWidth:0.8];
    [self.registerTextfieldBackView topInContainerRatio:0.5 shouldResize:NO];
    
    [ZZTools setShadow:_registerTextfieldBackView width:5 cornerRadius:REGIS_BACK_VIEW_CORNERWIDTH/2];
    [ZZTools setCornerRadius:_registerTextfieldBackView width:REGIS_BACK_VIEW_CORNERWIDTH/2];
    
    self.assureButton.ct_height = 55;
    [self.assureButton fillWidth:0.5];
    [self.assureButton top:-30 FromView:self.registerTextfieldBackView];
    [ZZTools setCornerRadius:self.assureButton width:ASSURE_BACK_VIEW_CORNERWIDTH/2];
    
    [self needFrameSetting];
}

#pragma mark 需要frame设置之后才能进行的设置
- (void)needFrameSetting {
    
    [self setImageWithName:@"registerback1" backImageName:@"loginback2"];
    [ZZTools setShadow:self.zzNavigationBar width:5 cornerRadius:5];
}

#pragma mark action

- (void)assureRegister {
    [self.stepView setStepIndex:1 animation:YES];
    [self getVerifyCode];
}

- (void)getVerifyCode {
    
} 

#pragma mark lazyload
- (UIView *)registerTextfieldBackView
{
    if (_registerTextfieldBackView == nil) {
        _registerTextfieldBackView = [[UIView alloc] init];
        _registerTextfieldBackView.backgroundColor = [UIColor whiteColor];
    }
    return _registerTextfieldBackView;
}

- (UIView *)lineViewa {
    if (_lineViewa == nil) {
        _lineViewa = [[UIView alloc] init];
        _lineViewa.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineViewa;
}

- (UIView *)lineViewp {
    if (_lineViewp == nil) {
        _lineViewp = [[UIView alloc] init];
        _lineViewp.backgroundColor = [UIColor lightGrayColor];
    }
    return _lineViewp;
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

- (UITextField *)idInputView {
    if (_idInputView == nil) {
        _idInputView = [[UITextField alloc] init];
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;
        NSAttributedString *attri  = [[NSAttributedString alloc] initWithString:@"请输入手机号" attributes:@{NSForegroundColorAttributeName:ZZ_COMMON_GRAY,NSFontAttributeName:[UIFont systemFontOfSize:15], NSParagraphStyleAttributeName:style}];
        _idInputView.attributedPlaceholder = attri;
        
        _idInputView.textAlignment = NSTextAlignmentLeft;
        _idInputView.font = [UIFont systemFontOfSize:18];
        _idInputView.textColor = [UIColor grayColor];
        
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
        NSAttributedString *attri  = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSForegroundColorAttributeName:ZZ_COMMON_GRAY,NSFontAttributeName:[UIFont systemFontOfSize:15], NSParagraphStyleAttributeName:style}];
        _pswInputView.attributedPlaceholder = attri;
        
        _pswInputView.textAlignment = NSTextAlignmentLeft;
        _pswInputView.font = [UIFont systemFontOfSize:18];
        _pswInputView.textColor = [UIColor grayColor];
        _pswInputView.secureTextEntry = YES;
    }
    _pswInputView.tintColor = [UIColor lightGrayColor];
    return _pswInputView;
}


@end
