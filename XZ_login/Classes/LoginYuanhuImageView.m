//
//  LoginYuanhuImageView.m
//  AllView
//
//  Created by apple on 2019/3/4.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "LoginYuanhuImageView.h"

@implementation LoginYuanhuImageView

//- (instancetype)init {
//    if (self = [super init]) {
//        [self cropImageWithImageV:nil pointArr:nil];
//    }
//    return self;
//}

- (void)cutImage {
    self.image = [self cropImageWithImageV:nil pointArr:nil];
}

- (UIImage *) cropImageWithImageV:(UIImageView *)imageV pointArr:(NSMutableArray *)pointArr {
    
    CGFloat w= self.frame.size.width;
    CGFloat h= self.frame.size.height;
    CGFloat arcCenterX= self.frame.size.width/2;
    
    imageV = self;
    
    pointArr = (NSMutableArray *)@[@(CGPointMake(0, 0)),@(CGPointMake(0, h-40)),@(CGPointMake(w, h-40)),@(CGPointMake(w, 0)),@(CGPointMake(0, 0))];
    CGRect rect = CGRectZero;
    rect.size = imageV.image.size;
    
    UIGraphicsBeginImageContextWithOptions(rect.size, YES, 0.0);
    
    [[UIColor blackColor] setFill];
    UIRectFill(rect);
    [[UIColor whiteColor] setFill];
    
    UIBezierPath *aPath = [UIBezierPath bezierPath];
    
    //起点
    NSValue * v = pointArr[0];
    CGPoint p = [v CGPointValue];
    CGPoint m_p = [self convertCGPoint:p fromRect1:imageV.frame.size toRect2:imageV.image.size];
    [aPath moveToPoint:m_p];
    
    //其他点
    for (int i = 1; i< pointArr.count; i++) {
        NSValue * v1 = pointArr[i];
        CGPoint p1 = [v1 CGPointValue];
        CGPoint m_p = [self convertCGPoint:p1 fromRect1:imageV.frame.size toRect2:imageV.image.size];
        CGPoint arcm_p = [self convertCGPoint:CGPointMake(arcCenterX, h) fromRect1:imageV.frame.size toRect2:imageV.image.size];
        if (i == 2) {
            [aPath addQuadCurveToPoint:m_p controlPoint:arcm_p];
        } else {        
            [aPath addLineToPoint:m_p];
        }
    }
    
    [aPath closePath];
    [aPath fill];
    
    //遮罩层
    UIImage *mask = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, 0.0);
    
    CGContextClipToMask(UIGraphicsGetCurrentContext(), rect, mask.CGImage);
    [imageV.image drawAtPoint:CGPointZero];
    
    UIImage *maskedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return maskedImage;
}
- (CGPoint)convertCGPoint:(CGPoint)point1 fromRect1:(CGSize)rect1 toRect2:(CGSize)rect2 {
    point1.y = rect1.height - point1.y;
    CGPoint result = CGPointMake((point1.x*rect2.width)/rect1.width, (point1.y*rect2.height)/rect1.height);
    return result;
}

@end
