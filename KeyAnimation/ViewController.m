//
//  ViewController.m
//  KeyAnimation
//
//  Created by yuping on 15/5/10.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "ViewController.h"
#import "MyView.h"
@interface ViewController () {
    
    CALayer *_layer;
    BOOL _isBei;
    int count;
    UIImageView *_imageView;
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
    MyView *myView = [[MyView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:myView];
    myView.backgroundColor = [UIColor greenColor];
    [myView.layer addSublayer:_layer];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(300, 400, 50, 30);
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    [self dianZan];
    
}

- (void)click {
    _isBei = !_isBei;
    if (_isBei) {
        [self translationBeiAnimation];
    } else {
        [self translationAnimation];
        
    }

}

- (void)dianZan {
     _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 50, 30, 30)];
    _imageView.userInteractionEnabled = YES;
    _imageView.layer.contents = (__bridge id)([UIImage imageNamed:@"2"].CGImage);
    [self.view addSubview:_imageView];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    [_imageView addGestureRecognizer:singleTap];
    
}

- (void)singleTap:(UITapGestureRecognizer *)tap {
    _imageView.layer.contents = (id)[UIImage imageNamed:(count%2==0?@"1":@"2")].CGImage;
    CAKeyframeAnimation *k = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"];
//    k.duration = 3;
    k.values = @[@(0.1),@(1.0),@(1.5)];
    k.keyTimes = @[@(0.0),@(0.2),@(0.5),@(1)];
    k.calculationMode = kCAAnimationLinear;
    
    count++;
    [_imageView.layer addAnimation:k forKey:@"SHOW"];
}

#pragma mark 关键帧普通动画
-(void)translationAnimation{
    //1.创建关键帧动画并设置动画属性
    CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //2.设置关键帧,这里有四个关键帧
    NSValue *key1=[NSValue valueWithCGPoint:_layer.position];//对于关键帧动画初始值不能省略
    NSValue *key2=[NSValue valueWithCGPoint:CGPointMake(80, 220)];
    NSValue *key3=[NSValue valueWithCGPoint:CGPointMake(45, 300)];
    NSValue *key4=[NSValue valueWithCGPoint:CGPointMake(100, 400)];
    NSArray *values=@[key1,key2,key3,key4];
    keyframeAnimation.values=values;
    //设置其他属性
    keyframeAnimation.duration=8.0;
    keyframeAnimation.beginTime=CACurrentMediaTime();//设置延迟2秒执行
    
    //3.添加动画到图层，添加动画后就会执行动画
    [_layer addAnimation:keyframeAnimation forKey:@"KCKeyframeAnimation_Position"];
}

#pragma mark 关键帧贝塞尔曲线动画

-(void)translationBeiAnimation{
    //1.创建关键帧动画并设置动画属性
    CAKeyframeAnimation *keyframeAnimation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    //2.设置路径
    CGMutablePathRef path=CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, _layer.position.x, _layer.position.y);//移动到起始点
    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 300, 55, 400);//绘制贝塞尔曲线
    
    keyframeAnimation.path=path;//设置path属性
    CGPathRelease(path);//释放路径对象
    //设置其他属性
    keyframeAnimation.duration=8.0;
    keyframeAnimation.beginTime=CACurrentMediaTime();
    //3.添加动画到图层，添加动画后就会执行动画
    [_layer addAnimation:keyframeAnimation forKey:@"KCKeyframeAnimation_Position"];
}






@end
