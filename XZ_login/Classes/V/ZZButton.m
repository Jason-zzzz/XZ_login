//
//  ZZButton.m
//  XZ_login
//
//  Created by apple on 2019/4/16.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "ZZButton.h"

@implementation ZZButton

- (instancetype)initWithText:(NSString *)text color:(UIColor *)color corner:(CGFloat)corner selector:(SEL)action actionController:(UIViewController *)controller {

    [self setTitle:text forState:UIControlStateNormal];
    self.backgroundColor = color;
    [self addTarget:controller action:action forControlEvents:UIControlEventTouchUpInside];
    return self;
}

@end
