//
//  ViewController.m
//  CATranstion
//
//  Created by yuping on 15/5/14.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () {
    
    UIView *baseView;
    int count;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    baseView = [[UIView alloc] initWithFrame:CGRectMake(60, 100, 200, 200)];
    baseView.backgroundColor = [UIColor redColor];
    [self.view addSubview:baseView];
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:baseView.bounds];
    imageView1.image = [UIImage imageNamed:@"1.jpg"];
    [baseView addSubview:imageView1];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:baseView.bounds];
    imageView2.image = [UIImage imageNamed:@"2.jpg"];
    
    [baseView addSubview:imageView2];
    
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    CATransition *transition = [CATransition animation];
    transition.duration = 3;
    switch (count) {
        case 0:
            transition.type = @"cube";//立方体翻转效果
            break;
        case 1:
            transition.type = @"oglFlip";//翻转效果
            break;
        case 2:
            transition.type = @"suckEffect";//收缩效果
            break;
        case 3:
            transition.type = @"rippleEffect";//水滴波纹效果
            break;
        case 4:
            transition.type = @"pageCurl";//向上翻页效果
            break;
        case 5:
            transition.type = @"pageUnCurl";//向下翻页效果
            break;
        case 6:
            transition.type = @"cameralIrisHollowOpen";//摄像头打开效果
            break;
        case 7:
            transition.type = @"cameraIrisHollowClose";//摄像头关闭效果
            break;
            
        default:
            break;
    }
    
    transition.subtype = kCATransitionFromLeft;
        [baseView exchangeSubviewAtIndex:0 withSubviewAtIndex:1];
    [baseView.layer addAnimation:transition forKey:@"transition"];
    count ++;
}

@end
