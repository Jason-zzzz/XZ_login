//
//  StepProgressView.m
//  XZ_login
//
//  Created by apple on 2019/4/16.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "StepProgressView.h"

// 步骤条主题色
#define TINT_COLOR ZZ_COMMON_ORANGE // [UIColor colorWithRed:35/255.f green:135/255.f blue:255/255.f alpha:1]
#define CIRCLE_WIDTH 22.f

@interface StepProgressView ()

@property (nonatomic, copy) NSArray *titlesArray;
@property (nonatomic, assign) NSUInteger stepIndex;

@property (nonatomic, strong) GGProgressView *progressView;
@property (nonatomic, strong) NSMutableArray *circleViewArray;
@property (nonatomic, strong) NSMutableArray *titleLabelArray;
@property (nonatomic, strong) UILabel *indicatorLabel;

@end

@implementation StepProgressView

#pragma mark - Init

- (instancetype)initWithFrame:(CGRect)frame titlesArray:(NSArray *)titlesArray stepIndex:(NSUInteger)stepIndex {
    self = [super initWithFrame:frame];
    if (self) {
        _titlesArray = [titlesArray copy];
        _stepIndex = stepIndex;
        // 进度条
        [self addSubview:self.progressView];
        
        for (NSString *title in _titlesArray) {
            
            // 圆圈
            UIView *circle = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CIRCLE_WIDTH, CIRCLE_WIDTH)];
            circle.backgroundColor = ZZ_COMMON_LIGHT_GRAY;
            circle.layer.cornerRadius = CIRCLE_WIDTH / 2;
            [self addSubview:circle];
            [self.circleViewArray addObject:circle];
            
            // 标题
            UILabel *label = [[UILabel alloc] init];
            label.text = title;
            label.font = [UIFont systemFontOfSize:14];
            label.textAlignment = NSTextAlignmentCenter;
            [self addSubview:label];
            [self.titleLabelArray addObject:label];
        }
        
        // 当前索引数字
        [self addSubview:self.indicatorLabel];
    }
    return self;
}

// 布局更新页面元素
- (void)layoutSubviews {
    
    CGFloat w = self.progressView.frame.size.width * 1.0 / ((self.titlesArray.count - 1) * 2);
    CGFloat u = 2*w;
    
    for (int i = 0; i < self.titlesArray.count; i++) {
        // 圆圈
        UIView *circle = self.circleViewArray[i];
        if (circle) {
            CGFloat x = 54+i*u;
            circle.center = CGPointMake(x, self.progressView.center.y);
            // 更新颜色
            self.stepIndex = self.stepIndex;
        }
        
        // 标题
        UILabel *label = self.titleLabelArray[i];
        if (label) {
        }
    }
}

#pragma mark - Custom Accessors

- (GGProgressView *)progressView {
    if (!_progressView) {
        _progressView = [[GGProgressView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 10)];
        _progressView.backgroundColor = ZZ_COMMON_LIGHT_GRAY;
        _progressView.progressTintColor = TINT_COLOR;
    }
    return _progressView;
}

- (UILabel *)indicatorLabel {
    if (!_indicatorLabel) {
        //        _indicatorLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 23, 23)];
        _indicatorLabel.textColor = TINT_COLOR;
        _indicatorLabel.textAlignment = NSTextAlignmentCenter;
        _indicatorLabel.backgroundColor = [UIColor whiteColor];
        _indicatorLabel.layer.cornerRadius = 23.0f / 2;
        _indicatorLabel.layer.borderColor = [TINT_COLOR CGColor];
        _indicatorLabel.layer.borderWidth = 1;
        _indicatorLabel.layer.masksToBounds = YES;
    }
    return _indicatorLabel;
}

- (NSMutableArray *)circleViewArray {
    if (!_circleViewArray) {
        _circleViewArray = [[NSMutableArray alloc] initWithCapacity:self.titlesArray.count];
    }
    return _circleViewArray;
}

- (NSMutableArray *)titleLabelArray {
    if (!_titleLabelArray) {
        _titleLabelArray = [[NSMutableArray alloc] initWithCapacity:self.titlesArray.count];
    }
    return _titleLabelArray;
}

- (void)setProgressViewHeight:(CGFloat)height {
    // 进度条
    self.progressView.frame = CGRectMake(0, 0, self.frame.size.width*0.8*0.8, height);
    [self.progressView setZZFrame:CGRectMake(0, 0, self.frame.size.width*0.8*0.8, height)];
    self.progressView.center = CGPointMake(self.frame.size.width / 2, self.frame.size.height / 4);
    self.progressView.progress = (-1./((self.titlesArray.count-1)*2))+(_stepIndex+1)*(1./(self.titlesArray.count-1));
}

// 设置当前进度索引，更新圆形图片、文本颜色、当前索引数字
- (void)setStepIndex:(NSUInteger)stepIndex {
    
    [UIView animateWithDuration:0.25 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        
        CGFloat value = (-1./((self.titlesArray.count-1)*2))+(stepIndex+1)*(1./(self.titlesArray.count-1));
        self.progressView.progress = value;
    } completion:nil];
    
    CGFloat delay = 0.125;
    if (stepIndex == self.titlesArray.count-1) {
        delay = 0.215;
    }
    [UIView animateWithDuration:0.1 delay:delay options:UIViewAnimationOptionCurveLinear animations:^{
        
        for (int i = 0; i < self.titlesArray.count; i++) {
            UIView *circle = self.circleViewArray[i];
            if (stepIndex >= i) {
                circle.backgroundColor = TINT_COLOR;
            } else {
                circle.backgroundColor = ZZ_COMMON_LIGHT_GRAY;
            }
        }
    } completion:^(BOOL finished) {
    }];
}

#pragma mark - Public

- (void)setStepIndex:(NSUInteger)stepIndex animation:(BOOL)animation {
    if (stepIndex < self.titlesArray.count) {
        // 更新颜色
        self.stepIndex = stepIndex;
        
        // 设置当前索引数字
        self.indicatorLabel.text = [NSString stringWithFormat:@"%lu", stepIndex + 1];
        self.indicatorLabel.center = ((UIView *)[self.circleViewArray objectAtIndex:stepIndex]).center;
    }
}

@end

