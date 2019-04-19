
//
//  OtherLoginButton.m
//  XZ_login
//
//  Created by apple on 2019/3/15.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "CircleButton.h"
#import "LoginHeader.h"

@implementation CircleButton

- (instancetype)init {
    if (self = [super init]) {
        
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    [ZZTools setCornerRadius:self width:rect.size.width];
}

@end
