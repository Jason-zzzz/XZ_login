//
//  ZZButton.h
//  XZ_login
//
//  Created by apple on 2019/4/16.
//  Copyright © 2019年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZZButton : UIButton

- (instancetype)initWithText:(NSString *)text color:(UIColor *)color corner:(CGFloat)corner selector:(SEL)action actionController:(UIViewController *)controller ;

@end

NS_ASSUME_NONNULL_END
