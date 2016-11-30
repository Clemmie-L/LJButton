# LJButton
```
一个封装系统的button。
 好处：集中式创建，减少代码操作量，快速创建
      随意控制文本和图片的间距 （平等平分）

###button 类型

LJAligenmentStatusNormal = 0, // 默认
LJAligenmentStatusLeft,       // 左对齐
LJAligenmentStatusCenter,     // 居中对齐
LJAligenmentStatusRight,      // 右对齐
LJAligenmentStatusTop,        // 图标在上，文本在下(居中)
LJAligenmentStatusBottom,     // 图标在下，文本在上(居中)

/**
文本跟图片的距离 默认为5像素  随意控制不越界
*/
@property (nonatomic, assign) CGFloat LJ_padding; 

###样式代码

创建button

LJButton *button = [[LJButton alloc]initWithAligenmentStatus:LJAligenmentStatusBottom andTitleStr:@"图标在下，文本在上(居中)" andTitleFont:10 andImageNormal:@"bub_black" andImageHighL:nil andFrame:CGRectMake(100, 50, 200,50) andSelector:^(NSUInteger tag) {
//点击事件
NSLog(@"000000");
}];
//    button.LJ_padding = 50;//设置文本和图片的间隔距离
button.backgroundColor = [UIColor greenColor];
[self.view addSubview:button];
