//
//  LoginBackView.m
//  XZ_login
//
//  Created by apple on 2019/4/15.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "LoginBackView.h"

@interface LoginBackView ()
 
@end

@implementation LoginBackView

- (instancetype)init {
    if (self = [super init]) {
        [self addSubview:self.backgroundYuanhuView];
        [self addSubview:self.backgroundYuanhuImageView];
    }
    return self;
}

- (void)setImageWithName:(NSString *)headImageName backImageName:(NSString *)backImageName {
    
    _backgroundYuanhuImageView.image = [UIImage imageNamed:headImageName inPrivateBundle:@"XZ_login"];
    [_backgroundYuanhuView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:backImageName inPrivateBundle:@"XZ_login"]]];
}

- (UIView *)backgroundYuanhuImageView
{
    if (_backgroundYuanhuImageView == nil) {
        _backgroundYuanhuImageView = [[LoginYuanhuImageView alloc] init];
        _backgroundYuanhuImageView.backgroundColor = [UIColor clearColor];
        [_backgroundYuanhuImageView setContentMode:UIViewContentModeScaleAspectFill];
        _backgroundYuanhuImageView.frame = CGRectMake(0, 0, SCREEN_WIDTH, BACK_VIEW_IMAGE_HEIGHT);
        
//        _backgroundYuanhuImageView.image = [UIImage imageNamed:@"loginback1" inPrivateBundle:@"XZ_login"];
    }
    return _backgroundYuanhuImageView;
}

- (UIView *)backgroundYuanhuView
{
    if (_backgroundYuanhuView == nil) {
        _backgroundYuanhuView = [[LoginYuanhuView alloc] init];
        _backgroundYuanhuView.backgroundColor = [UIColor clearColor];
        _backgroundYuanhuView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        
        //        NSLog(@"%@", [NSBundle privateBundleWithName:@"XZ_login" targetClass:[self class]]);
//        [_backgroundYuanhuView addSubview:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loginback2" inPrivateBundle:@"XZ_login"]]];
    }
    return _backgroundYuanhuView;
}

@end
