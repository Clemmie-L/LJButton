//
//  LJCostomButton.m
//  LJCustomButton
//
//  Created by Clemmie on 16/11/24.
//  Copyright © 2016年 LJCustomDemo. All rights reserved.
//

#import "LJButton.h"
#import <objc/runtime.h>

/*! 定义宏：按钮中文本和图片的间隔 */
#define LJ_margin 5
#define LJ_buttonRadio 0.5
/*! 获得按钮的大小 */
#define LJ_buttonW     self.bounds.size.width
#define LJ_buttonH     self.bounds.size.height
/*! 获得按钮中UILabel文本的大小 */
#define LJ_labelW     self.titleLabel.bounds.size.width
#define LJ_labelH     self.titleLabel.bounds.size.height
/*! 获得按钮中image图标的大小 */
#define LJ_imageW     self.imageView.bounds.size.width
#define LJ_imageH     self.imageView.bounds.size.height

@interface LJButton ()
/**
 点击事件回调
 */
@property (nonatomic, copy) void (^UIButtonClickAction)(NSUInteger tag);
/**
 button 样式
 */
@property(nonatomic,assign) LJAligenmentStatus LJ_buttonStatus;
@end

@implementation LJButton

#pragma mark - 对象方法创建
- (instancetype)initWithAligenmentStatus:(LJAligenmentStatus)status
                             andTitleStr:(NSString *)title
                            andTitleFont:(CGFloat)sizeFont
                          andImageNormal:(NSString *)imageN
                           andImageHighL:(NSString *)iamgeH
                                andFrame:(CGRect)frame
                             andSelector:(UIButtonClickAction)clickAction {
    
    if (self = [super init]) {
        // 按钮状态状态
        _LJ_buttonStatus = status;
        // 默认文本跟图片的距离
        _LJ_padding = LJ_margin;
        //按钮属性设置
        [self setTitle:title forState:UIControlStateNormal];
        [self setImage:[UIImage imageNamed:imageN] forState:UIControlStateNormal];
        self.titleLabel.font = [UIFont systemFontOfSize:sizeFont];
        [self setImage:[UIImage imageNamed:iamgeH] forState:UIControlStateHighlighted];
        [self setBackgroundColor:[UIColor clearColor]];
        [self LJ_TitleColcor:[UIColor blackColor] forState:UIControlStateNormal];
        self.frame = frame;
        //点击事件回调
        if (clickAction) {
            _UIButtonClickAction = clickAction;
            [self addTarget:self action:@selector(btnClickAction:) forControlEvents:UIControlEventTouchUpInside];
        }
    }
    return self;
}

#pragma mark - 类方法创建
+ (instancetype)buttonAligenmentStatus:(LJAligenmentStatus)status
                           andTitleStr:(NSString *)title
                          andTitleFont:(CGFloat)sizeFont
                        andImageNormal:(NSString *)imageN
                         andImageHighL:(NSString *)iamgeH
                              andFrame:(CGRect)frame
                           andSelector:(UIButtonClickAction)clickAction {
    
    return [[LJButton alloc]initWithAligenmentStatus:status
                                         andTitleStr:title
                                        andTitleFont:sizeFont
                                      andImageNormal:imageN
                                       andImageHighL:iamgeH
                                            andFrame:frame
                                         andSelector:clickAction];
}

#pragma mark - 内方法
+ (void)load {
    Method orMethod1 = class_getInstanceMethod(self, @selector(setTitleColor:forState:));
    Method newMethod1 = class_getInstanceMethod(self, @selector(LJ_TitleColcor:forState:));
    
    BOOL success1 = class_addMethod(self, @selector(setTitleColor:forState:), method_getImplementation(newMethod1), method_getTypeEncoding(newMethod1));
    
    if (success1) { //如果在父类没有定义原始方法，orMethod 为nil, 则用 class_replace 替换。如果有 则正常的替换
        class_replaceMethod(self, @selector(LJ_TitleColcor:forState:), method_getImplementation(orMethod1), method_getTypeEncoding(orMethod1));
    }else {
        method_exchangeImplementations(orMethod1, newMethod1);
    }
    
    Method orMethod2 = class_getInstanceMethod(self,@selector(setBackgroundImage:forState:));
    Method newMethod2 = class_getInstanceMethod(self, @selector(LJ_BackgroundImage:forState:));
    
    BOOL success2 = class_addMethod(self, @selector(setBackgroundImage:forState:), method_getImplementation(newMethod2), method_getTypeEncoding(newMethod2));
    if (success2) {
        class_replaceMethod(self, @selector(LJ_BackgroundImage:forState:), method_getImplementation(orMethod2), method_getTypeEncoding(orMethod2));
    }else {
        method_exchangeImplementations(orMethod2, newMethod2);
    }
}

#pragma mark - 按钮背景图片
- (void)LJ_BackgroundImage:(UIImage *)image forState:(UIControlState)state {
    
}

#pragma mark - 按钮背景颜色
- (void)setLJ_backgroundColor:(UIColor *)LJ_backgroundColor {
    self.backgroundColor = LJ_backgroundColor;
}

#pragma mark - 设置按钮文本颜色
- (void)LJ_TitleColcor:(UIColor *)color forState:(UIControlState)state {
    
}

#pragma mark - 按钮点击事件;
- (void)btnClickAction:(UIButton *)button {
    if (self.UIButtonClickAction) {
        self.UIButtonClickAction(button.tag);
    }
}

#pragma mark - 文本跟图片的距离判断
- (void)setLJ_padding:(CGFloat)LJ_padding {
    if (LJ_padding < 0) {
        LJ_padding = 0;
    }
    if (_LJ_buttonStatus == LJAligenmentStatusNormal) {
        
    }else if (_LJ_buttonStatus == LJAligenmentStatusTop || _LJ_buttonStatus == LJAligenmentStatusBottom) {
        if (LJ_imageH + LJ_labelH + LJ_padding > LJ_buttonH) {
            LJ_padding = LJ_buttonH - LJ_imageH - LJ_labelH - LJ_margin;
        }
    }else {//横向排列
        if (LJ_imageW + LJ_labelW + LJ_padding > LJ_buttonW) {
            LJ_padding = LJ_buttonW - LJ_imageW - LJ_labelW - LJ_margin;
        }
    }
    _LJ_padding = LJ_padding;
}


#pragma mark - 图标，文本在左(居中,局左，局右)
- (void)alignmentCenterOrLeftOrRight {
    CGFloat margin = 0;
    if (_LJ_buttonStatus == LJAligenmentStatusCenter) {
        margin = (LJ_buttonW - LJ_imageW - LJ_labelW - _LJ_padding) *LJ_buttonRadio;
    }else if (_LJ_buttonStatus == LJAligenmentStatusLeft) {
        margin = 0;
    }else if (_LJ_buttonStatus == LJAligenmentStatusRight) {
        margin = LJ_buttonW - LJ_imageW - LJ_labelW - _LJ_padding;
    }
    CGRect titleFrame = self.titleLabel.frame;
    titleFrame.origin.x = margin;
    self.titleLabel.frame = titleFrame;
    
    CGRect imgFrame = self.imageView.frame;
    imgFrame.origin.x = CGRectGetMaxX(titleFrame) +_LJ_padding;
    self.imageView.frame = imgFrame;
}

#pragma mark - 图标在上或下，文本(居中)
- (void)alignmentTopOrBottom {
    CGFloat imageX = (LJ_buttonW - LJ_imageW) *LJ_buttonRadio;
    CGFloat labelX = (LJ_buttonW - LJ_labelW) *LJ_buttonRadio;
    CGFloat margin = (LJ_buttonH - LJ_imageH - LJ_labelH - _LJ_padding) *LJ_buttonRadio;
    CGRect labelFrame = self.titleLabel.frame;
    CGRect imgFrame = self.imageView.frame;
    labelFrame.origin.x = labelX;
    imgFrame.origin.x = imageX;
    
    if (_LJ_buttonStatus == LJAligenmentStatusTop) {
        imgFrame.origin.y = margin;
        labelFrame.origin.y = CGRectGetMaxY(imgFrame) +_LJ_padding;
    }else if (_LJ_buttonStatus == LJAligenmentStatusBottom) {
        labelFrame.origin.y = margin;
        imgFrame.origin.y = CGRectGetMaxY(labelFrame) +_LJ_padding;
    }
    self.titleLabel.frame = labelFrame;
    self.imageView.frame = imgFrame;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    if (_LJ_buttonStatus == LJAligenmentStatusNormal) {
        
    }else if (_LJ_buttonStatus == LJAligenmentStatusTop || _LJ_buttonStatus == LJAligenmentStatusBottom) {
        [self alignmentTopOrBottom];
    }else {
        [self alignmentCenterOrLeftOrRight];
    }
}

@end
