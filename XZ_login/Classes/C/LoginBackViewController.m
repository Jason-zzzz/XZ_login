//
//  LoginBackViewController.m
//  XZ_login
//
//  Created by apple on 2019/4/15.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "LoginBackViewController.h"
#import "LoginBackView.h"

@interface LoginBackViewController ()

@property (nonatomic, strong) LoginBackView * loginBackView;

@end

@implementation LoginBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.canDropdown = @"1";
    [self.view addSubview:self.loginBackView];
}

- (void)setImageWithName:(NSString *)headImageName backImageName:(NSString *)backImageName {
    
    [_loginBackView setImageWithName:headImageName backImageName:backImageName];
    [_loginBackView.backgroundYuanhuImageView cutImage];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (UIView *)loginBackView
{
    if (_loginBackView == nil) {
        _loginBackView = [[LoginBackView alloc] init];
        _loginBackView.backgroundColor = [UIColor clearColor];
        [_loginBackView setContentMode:UIViewContentModeScaleAspectFill];
        _loginBackView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
    }
    return _loginBackView;
}

- (void)dealloc
{
    [self clearNotificationAndGesture];
}

@end
