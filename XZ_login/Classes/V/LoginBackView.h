//
//  LoginBackView.h
//  XZ_login
//
//  Created by apple on 2019/4/15.
//  Copyright © 2019年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginHeader.h"
#import "LoginYuanhuView.h"
#import "LoginYuanhuImageView.h"

NS_ASSUME_NONNULL_BEGIN

#define BACK_VIEW_IMAGE_HEIGHT 240.0

@interface LoginBackView : UIView

@property (nonatomic, strong) LoginYuanhuView * backgroundYuanhuView;
@property (nonatomic, strong) LoginYuanhuImageView * backgroundYuanhuImageView;

- (void)setImageWithName:(NSString *)headImageName backImageName:(NSString *)backImageName;

@end

NS_ASSUME_NONNULL_END
