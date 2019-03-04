//
//  LoginViewController.m
//  AllView
//
//  Created by apple on 2019/2/26.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "LoginViewController.h"
#import "UIView+LayoutMethods.h"
#import "ZZTools.h"
#import "LoginYuanhuView.h"
#import "LoginYuanhuImageView.h"

#define INPUT_BACK_VIEW_CORNERWIDTH 48.0
#define BACK_VIEW_IMAGE_HEIGHT 240.0

@interface LoginViewController ()

@property (nonatomic, strong) UIButton * loginButton;
@property (nonatomic, strong) UIView * idInputBackView;
@property (nonatomic, strong) UIView * pswInputBackView;
@property (nonatomic, strong) LoginYuanhuView * backgroundYuanhuView;
@property (nonatomic, strong) LoginYuanhuImageView * backgroundYuanhuImageView;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.backgroundYuanhuView];
    [self.view addSubview:self.backgroundYuanhuImageView];
    [self.view addSubview:self.idInputBackView];
    [self.view addSubview:self.pswInputBackView];
    self.view.layer.masksToBounds = YES;
    [ZZTools setShadow:self.zzNavigationBar width:5 cornerRadius:5];
    self.zzNavigationBar.zzBackgroundColor = [UIColor clearColor];
    
//    self.zzNavigationBar.hidden = YES;
    // Do any additional setup after loading the view.
}

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
    
    UILabel * placeholderLabel = [[UILabel alloc] init];
    [_idInputBackView addSubview:placeholderLabel];
    placeholderLabel.ct_size = CGSizeMake(0, _idInputBackView.ct_height);
    [placeholderLabel fillWidth:0.8];
    [placeholderLabel topInContainerRatio:0 shouldResize:NO];
    placeholderLabel.text = @"请输入账号/手机号";
    placeholderLabel.textAlignment = NSTextAlignmentCenter;
    placeholderLabel.textColor = [UIColor colorWithWhite:0.8 alpha:1];
    placeholderLabel.font = [UIFont systemFontOfSize:17 weight:0.05];
    
    UILabel * placeholderLabel2 = [[UILabel alloc] init];
    [_pswInputBackView addSubview:placeholderLabel2];
    placeholderLabel2.ct_size = CGSizeMake(0, _idInputBackView.ct_height);
    [placeholderLabel2 fillWidth:0.8];
    [placeholderLabel2 topInContainerRatio:0 shouldResize:NO];
    placeholderLabel2.text = @"请输入密码";
    placeholderLabel2.textAlignment = NSTextAlignmentCenter;
    placeholderLabel2.textColor = [UIColor colorWithWhite:0.8 alpha:1];
    placeholderLabel2.font = [UIFont systemFontOfSize:17 weight:0.05];
    
    
    [_backgroundYuanhuImageView cutImage];
}

#pragma mark - getters and setters

- (UIView *)backgroundYuanhuImageView
{
    if (_backgroundYuanhuImageView == nil) {
        _backgroundYuanhuImageView = [[LoginYuanhuImageView alloc] init];
        _backgroundYuanhuImageView.backgroundColor = [UIColor clearColor];
        [_backgroundYuanhuImageView setContentMode:UIViewContentModeScaleAspectFill];
        _backgroundYuanhuImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, BACK_VIEW_IMAGE_HEIGHT);
        _backgroundYuanhuImageView.image = [UIImage imageNamed:@"loginback1"];
    }
    return _backgroundYuanhuImageView;
}

- (UIView *)backgroundYuanhuView
{
    if (_backgroundYuanhuView == nil) {
        _backgroundYuanhuView = [[LoginYuanhuView alloc] init];
        _backgroundYuanhuView.backgroundColor = [UIColor clearColor];
        _backgroundYuanhuView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [_backgroundYuanhuView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loginback2"]]];
    }
    return _backgroundYuanhuView;
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
