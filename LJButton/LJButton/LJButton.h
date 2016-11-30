//
//  LJCostomButton.h
//  LJCustomButton
//
//  Created by Clemmie Lau on 16/11/24.
//  Copyright © 2016年 LJCustomDemo. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum{
    LJAligenmentStatusNormal = 0, // 默认
    LJAligenmentStatusLeft,       // 左对齐
    LJAligenmentStatusCenter,     // 居中对齐
    LJAligenmentStatusRight,      // 右对齐
    LJAligenmentStatusTop,        // 图标在上，文本在下(居中)
    LJAligenmentStatusBottom,     // 图标在下，文本在上(居中)
}LJAligenmentStatus;

typedef void(^UIButtonClickAction)(NSUInteger tag);

@interface LJButton : UIButton

/**
 对象方法初始化
 @param status      button 样式
 @param title       button 文本
 @param sizeFont    button 文本字体
 @param imageN      button normal图片
 @param iamgeH      button highlight图片
 @param frame       button frame
 @param clickAction button 点击事件

 @return 返回button
 */
- (nullable instancetype)initWithAligenmentStatus:(LJAligenmentStatus)status
                             andTitleStr:(nullable NSString *)title
                            andTitleFont:(CGFloat)sizeFont
                          andImageNormal:(nullable NSString *)imageN
                           andImageHighL:(nullable NSString *)iamgeH
                                andFrame:(CGRect)frame
                             andSelector:(nullable UIButtonClickAction)clickAction;
/**
 类方法初始化
 @param status      button 样式
 @param title       button 文本
 @param sizeFont    button 文本字体
 @param imageN      button normal图片
 @param iamgeH      button highlight图片
 @param frame       button frame
 @param clickAction button 点击事件
 
 @return 返回button
 */
+ (nullable instancetype)buttonAligenmentStatus:(LJAligenmentStatus)status
                              andTitleStr:(nullable NSString *)title
                             andTitleFont:(CGFloat)sizeFont
                           andImageNormal:(nullable NSString *)imageN
                            andImageHighL:(nullable NSString *)iamgeH
                                 andFrame:(CGRect)frame
                              andSelector:(nullable UIButtonClickAction)clickAction;

/**
 文本跟图片的距离 默认为5像素 
 */
@property (nonatomic, assign) CGFloat LJ_padding;

/**
 button 背景颜色
 */
@property(nullable,nonatomic,copy)UIColor *LJ_backgroundColor;

/**
 设置按钮文本颜色
 @param color [UIColor blackColor] 默认黑色
 @param state 按钮的状态
 */
- (void)LJ_TitleColcor:(nullable UIColor *)color forState:(UIControlState)state;

/**
 设置按钮背景图片
 @param image 图片
 @param state 按钮的状态
 */
- (void)LJ_BackgroundImage:(nullable UIImage *)image forState:(UIControlState)state;

@end
