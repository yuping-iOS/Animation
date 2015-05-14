//
//  ViewController.m
//  HiddenAnimation
//
//  Created by yuping on 15/5/14.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
    CALayer *_layer;
    NSArray *_colors;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //隐式动画
    /*
     随机数
     
     // 0 ~ 4 之间的随机数
     srand(time(NULL));
     NSLog(@"%d", rand() % 5);
     
     // 1 ~ 10 之间的随机数
     srandom(time(NULL));
     NSLog(@"%ld", random() % 10 + 1);
     
     // 1 ~ 5 之间的随机数 不需要设置随机种子 精度高
     NSLog(@"%d", arc4random() % 5 + 1);
     
     // 0 ~ 4 之间的随机数 不需要设置随机种子 精度高 不需要取余计算
     NSLog(@"%d", arc4random_uniform(5));
     */
    _layer = [[CALayer alloc] init];
    _layer.frame = CGRectMake(100, 100, 100, 100);
    _layer.backgroundColor = [UIColor redColor].CGColor;
    
    [self.view.layer addSublayer:_layer];
    
    _colors = @[[UIColor redColor], [UIColor yellowColor], [UIColor greenColor], [UIColor grayColor], [UIColor orangeColor], [UIColor purpleColor], [UIColor blueColor], [UIColor brownColor]];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    
    //创建显示事务
    //    [CATransaction begin];
    //设置时长
    //    [CATransaction setAnimationDuration:1.f];//默认0.25秒
    //关闭动画
    //[CATransaction setDisableActions:YES];
    //设置动画的速率
    /*
     动画的开始与结束的快慢:
     kCAMediaTimingFunctionLinear            线性,即匀速
     kCAMediaTimingFunctionEaseIn            先慢后快
     kCAMediaTimingFunctionEaseOut           先快后慢
     kCAMediaTimingFunctionEaseInEaseOut     先慢后快再慢
     kCAMediaTimingFunctionDefault           实际效果是动画中间比较快.
     */
    //    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    _layer.backgroundColor = [_colors[arc4random_uniform(8)] CGColor];
    _layer.position = location;
    _layer.cornerRadius = arc4random_uniform(50)+5;
    //    [CATransaction commit];
}

@end
