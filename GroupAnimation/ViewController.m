//
//  ViewController.m
//  GroupAnimation
//
//  Created by yuping on 15/5/10.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
    CALayer *_layer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    //自定义一个图层
    _layer=[[CALayer alloc]init];
    _layer.bounds=CGRectMake(0, 0, 20, 10);
    _layer.position=CGPointMake(50, 150);
    _layer.contents=(id)[UIImage imageNamed:@"3.jpg"].CGImage;
    [self.view.layer addSublayer:_layer];

}

#pragma mark 动画
//关键帧动画
- (CAKeyframeAnimation *)keyFrameAnimation {
    //1.创建关键帧动画并设置动画属性
    CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    //绘制贝塞尔曲线
    CGMutablePathRef path=CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _layer.position.x, _layer.position.y);//移动到起始点
    
    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 400, 150, 500);//绘制二次贝塞尔曲线
    keyframeAnimation.path=path;//设置path属性
    CGPathRelease(path);//释放路径对象
    return keyframeAnimation;
}

//基础动画
- (CABasicAnimation *)basic {
    
    CABasicAnimation *basicAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    [basicAnimation setToValue:@(2 * M_PI)];
    [basicAnimation setDuration:3.f];
    [_layer addAnimation:basicAnimation forKey:nil];
    
    return basicAnimation;
}
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CAAnimationGroup *group = [CAAnimationGroup animation];
    CAKeyframeAnimation *keyAni = [self keyFrameAnimation];
    CABasicAnimation *baseAni = [self basic];
    NSArray *groups = @[keyAni,baseAni];
    group.animations = groups;
    group.duration = 3;
    [group setRepeatCount:HUGE];
    group.autoreverses = YES;
    [_layer addAnimation:group forKey:nil];
    
}

@end
