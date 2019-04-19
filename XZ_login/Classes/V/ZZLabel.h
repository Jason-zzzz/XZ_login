//
//  ZZLabel.h
//  iOSTest
//
//  Created by apple on 2019/3/12.
//  Copyright © 2019年 apple. All rights reserved.
//

#import <UIKit/UIKit.h> 

@interface ZZLabel : UILabel

///高亮颜色 默认蓝色
@property(nonatomic,strong)UIColor *zzHighColor;

///常规颜色 默认黑色
@property(nonatomic,strong)UIColor *zzNormalColor;
///高亮部分选中颜色 默认与高亮一致
@property(nonatomic,strong)UIColor *zzSelectedColor;
///点击方法
@property(nonatomic,copy)void(^clickBlock)(NSString *);
///判定方法  存放正则表达式。 可以添加,也可以重置
@property(nonatomic,strong)NSMutableArray<NSString *> *ruleArray;
///设置高亮range
@property(nonatomic,assign)NSRange zzRange;

/**
 * 设置自动高亮text
 */
- (void)zzSetText:(NSString *)text;
/**
 * 设置text
 * @param text 文字
 * @param highColor 高亮颜色
 * @param clickBlock 点击高亮的回调
 */
- (void)zzSetText:(NSString *)text
   highLightedColor:(UIColor *)highColor
     withClickBlock:(void(^)(NSString *text))clickBlock;
/**
 * 设置text
 * @param text 文字
 * @param highColor 高亮颜色
 * @param normalColor 常规颜色
 * @param clickBlock 点击高亮的回调
 */
- (void)zzSetText:(NSString *)text
   highLightedColor:(UIColor *)highColor
    withNormalColor:(UIColor *)normalColor
     withClickBlock:(void(^)(NSString *text))clickBlock;
/**
 * 设置text
 * @param text 文字
 * @param highColor 高亮颜色
 * @param normalColor 常规颜色
 * @param clickBlock 点击高亮的回调
 */
- (void)zzSetText:(NSString *)text
   highLightedColor:(UIColor *)highColor
    withNormalColor:(UIColor *)normalColor
  withSelectedColor:(UIColor *)selectedColor
     withClickBlock:(void(^)(NSString *text))clickBlock;
/**
 * 设置text
 * @param text 文字
 * @param clickBlock 点击高亮的回调
 */
- (void)zzSetText:(NSString *)text
     withClickBlock:(void(^)(NSString *text))clickBlock;


@end
