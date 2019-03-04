//
//  LoginYuanhuView.m
//  AllView
//
//  Created by apple on 2019/3/1.
//  Copyright © 2019年 apple. All rights reserved.
//

#import "LoginYuanhuView.h"

@implementation LoginYuanhuView

- (void)drawRect:(CGRect)rect {
    
    //    确定头部所在的圆心
    CGFloat w= self.frame.size.width;
    CGFloat h= self.frame.size.height;
    CGFloat arcCenterX= self.frame.size.width/2;
    //身体
    CAShapeLayer *bodyLayer = [CAShapeLayer layer];
    UIBezierPath *bodyPath = [UIBezierPath bezierPath];
    [bodyPath moveToPoint:CGPointMake(-50, 0)];
    [bodyPath addLineToPoint:CGPointMake(0, h)];
    [bodyPath addLineToPoint:CGPointMake(w, h)];
    [bodyPath addLineToPoint:CGPointMake(w+50, 0)];
    [bodyPath addQuadCurveToPoint:CGPointMake(-50, 0) controlPoint:CGPointMake(arcCenterX, 150)]; 
//    [self setLayer:bodyLayer path:bodyPath ];
    bodyLayer.fillColor = [UIColor colorWithRed:21/255.0 green:159/255.0 blue:237/255.0 alpha:1].CGColor;
}

-(void)setLayer:(CAShapeLayer *)layer path:(UIBezierPath *)path{
    
    layer.path = path.CGPath;
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.strokeColor=[UIColor lightGrayColor].CGColor;
    [self.layer addSublayer:layer];
}

@end
