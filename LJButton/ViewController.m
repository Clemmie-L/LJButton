//
//  ViewController.m
//  LJButton
//
//  Created by Clemmie on 16/11/30.
//  Copyright © 2016年 LJDemo. All rights reserved.
//

#import "ViewController.h"
#import "LJButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /***********************demo1,创建多个按钮***********************/
//    for (int i = 0; i < 4; ++i) {
//        LJButton *button = [[LJButton alloc]initWithAligenmentStatus:LJAligenmentStatusCenter andTitleStr:[NSString stringWithFormat:@"第%d个按钮",i] andTitleFont:15 andImageNormal:@"bub_black" andImageHighL:nil andFrame:CGRectMake(100, 50*(i +1)+10*i, 200,50) andSelector:^(NSUInteger tag) {
//            if (tag == 0) {
//                NSLog(@"00000");
//            }else if ( tag == 1) {
//                NSLog(@"11111");
//            }else if ( tag == 2) {
//                NSLog(@"22222");
//            }else if ( tag == 3) {
//                NSLog(@"33333");
//            }
//        }];
//        button.tag = i;
//        button.backgroundColor = [UIColor greenColor];
//        [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//        [self.view addSubview:button];
//    }
    
    /***********************demo2,按钮样式展示***********************/
    LJButton *button = [[LJButton alloc]initWithAligenmentStatus:LJAligenmentStatusBottom andTitleStr:@"图标在下，文本在上(居中)" andTitleFont:10 andImageNormal:@"bub_black" andImageHighL:nil andFrame:CGRectMake(100, 50, 200,50) andSelector:^(NSUInteger tag) {
        NSLog(@"000000");
    }];
//    button.LJ_padding = 50;//设置文本和图片的间隔距离
    button.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button];
    
    
    LJButton *button1 = [[LJButton alloc]initWithAligenmentStatus:LJAligenmentStatusTop andTitleStr:@"居中[文本下图片上]" andTitleFont:15 andImageNormal:@"bub_black" andImageHighL:nil andFrame:CGRectMake(100, CGRectGetMaxY(button.frame)+10, 200,50) andSelector:^(NSUInteger tag) {
        NSLog(@"111111");
    }];
//    button1.LJ_padding = 50;//设置文本和图片的距离
    button1.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button1];
    
    
    LJButton *button2 = [[LJButton alloc]initWithAligenmentStatus:LJAligenmentStatusRight andTitleStr:@"右对齐" andTitleFont:15 andImageNormal:@"bub_black" andImageHighL:nil andFrame:CGRectMake(100, CGRectGetMaxY(button1.frame)+10, 200, 50) andSelector:^(NSUInteger tag) {
        NSLog(@"2222");
    }];
    button2.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button2];
    
    
    LJButton *button3 = [[LJButton alloc]initWithAligenmentStatus:LJAligenmentStatusCenter andTitleStr:@"居中对齐" andTitleFont:25 andImageNormal:@"bub_black" andImageHighL:nil andFrame:CGRectMake(100, CGRectGetMaxY(button2.frame)+10, 200, 50) andSelector:^(NSUInteger tag) {
        NSLog(@"333333");
    }];
    button3.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button3];
    
    LJButton *button4 = [[LJButton alloc]initWithAligenmentStatus:LJAligenmentStatusLeft andTitleStr:@"左对齐" andTitleFont:25 andImageNormal:@"bub_black" andImageHighL:nil andFrame:CGRectMake(100, CGRectGetMaxY(button3.frame)+10, 200, 50) andSelector:^(NSUInteger tag) {
        NSLog(@"444444");
    }];
    button4.backgroundColor = [UIColor greenColor];
    [self.view addSubview:button4];
    
}


@end
