//
//  StepProgressView.h
//  XZ_login
//
//  Created by apple on 2019/4/16.
//  Copyright © 2019年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginHeader.h"
#import "GGProgressView.h"

NS_ASSUME_NONNULL_BEGIN

@interface StepProgressView : UIView

// 指定初始化方法
- (instancetype)initWithFrame:(CGRect)frame titlesArray:(NSArray *)titlesArray stepIndex:(NSUInteger)stepIndex;

// 设置当前步骤
- (void)setStepIndex:(NSUInteger)stepIndex animation:(BOOL)animation;

- (void)setProgressViewHeight:(CGFloat)height;

@end

NS_ASSUME_NONNULL_END
