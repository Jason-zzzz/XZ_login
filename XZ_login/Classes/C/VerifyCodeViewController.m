//
//  VerifyCodeViewController.m
//  XZ_login
//
//  Created by apple on 2019/4/19.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "VerifyCodeViewController.h"

#define REGIS_BACK_VIEW_CORNERWIDTH 40.0
#define ASSURE_BACK_VIEW_CORNERWIDTH 30.0
#define INPUT_BACK_VIEW_CORNERWIDTH 40.0

@interface VerifyCodeViewController ()

@property (nonatomic, strong) ZZButton * assureButton;
@property (nonatomic, strong) UIView * registerTextfieldBackView;
@property (nonatomic, strong) UIView * idInputBackView;
@property (nonatomic, strong) UITextField * idInputView;
@property (nonatomic, strong) StepProgressView * stepView;
@property (nonatomic, strong) UIView * lineViewa;
@property (nonatomic, strong) UIView * lineViewp;

@end

@implementation VerifyCodeViewController

- (instancetype)init {
    if (self = [super init]) {
        self = [VerifyCodeViewController initView:self];
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
    _stepView = [[StepProgressView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) titlesArray:@[@"", @"", @""] stepIndex:1];
    [self.registerTextfieldBackView addSubview:_stepView];
    
    [self.registerTextfieldBackView addSubview:self.idInputBackView];
    [self.idInputBackView addSubview:self.idInputView];
    [self.idInputBackView addSubview:self.lineViewa];
    
    self.idInputView.keyboardType = UIKeyboardTypeNumberPad;
    //    self.pswInputView.keyboardType = UIKeyboardTypeNumberPad;
    
    self.zzNavigationBar.zzBackgroundColor = [UIColor clearColor];
    
    [self addNotification]; // 键盘遮挡检测
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.stepView setStepIndex:1 animation:YES];
}

#pragma mark 验证验证码
- (void)assureRegister {
    [self.stepView setStepIndex:2 animation:YES];
}

#pragma mark 所有frame都需要在这里设置
- (void)viewWillLayoutSubviews {
    
    [self.registerTextfieldBackView fillHeight:0.35];
    [self.registerTextfieldBackView fillWidth:0.8];
    [self.registerTextfieldBackView topInContainerRatio:0.5 shouldResize:NO];
    
    [ZZTools setShadow:_registerTextfieldBackView width:5 cornerRadius:REGIS_BACK_VIEW_CORNERWIDTH/2];
    [ZZTools setCornerRadius:_registerTextfieldBackView width:REGIS_BACK_VIEW_CORNERWIDTH/2];
    
    [self.stepView fillWidth];
    self.stepView.ct_height = 80;
    self.stepView.ct_top = 30;
    [self.stepView setProgressViewHeight:6];
    
//    self.idInputBackView.ct_size = CGSizeMake(100, INPUT_BACK_VIEW_CORNERWIDTH);
    self.idInputBackView.ct_height = 55;
    [self.idInputBackView fillWidth:0.8];
    [self.idInputBackView topInContainerRatio:0.4 shouldResize:NO];
    
    CGFloat apWidth = 0.9;
    [self.idInputView fillWidth:apWidth];
    [self.idInputView fillHeight];
    [self.idInputView fillHeight];
    [self.lineViewa fillWidth:apWidth];
    self.lineViewa.ct_height = 0.5;
    [self.lineViewa top:0 FromView:self.idInputView];
    
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

- (UIView *)idInputBackView
{
    if (_idInputBackView == nil) {
        _idInputBackView = [[UIView alloc] init];
        _idInputBackView.backgroundColor = [UIColor whiteColor];
    }
    return _idInputBackView;
}

- (UITextField *)idInputView {
    if (_idInputView == nil) {
        _idInputView = [[UITextField alloc] init];
        
        NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
        style.alignment = NSTextAlignmentCenter;
        NSAttributedString *attri  = [[NSAttributedString alloc] initWithString:@"请输入验证码" attributes:@{NSForegroundColorAttributeName:ZZ_COMMON_GRAY,NSFontAttributeName:[UIFont systemFontOfSize:15], NSParagraphStyleAttributeName:style}];
        _idInputView.attributedPlaceholder = attri;
        
        _idInputView.textAlignment = NSTextAlignmentCenter;
        _idInputView.font = [UIFont systemFontOfSize:24];
        _idInputView.textColor = [UIColor grayColor];
        
    }
    _idInputView.tintColor = [UIColor lightGrayColor];
    //    [[UITextField appearance] setTintColor:[UIColor blackColor]];
    return _idInputView;
}


@end
