//
//  MyView.m
//  KeyAnimation
//
//  Created by yuping on 15/5/10.
//  Copyright (c) 2015年 yuping. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (void)drawRect:(CGRect)rect {
    
    //1 获取上下文context
    CGContextRef context = UIGraphicsGetCurrentContext();
//    //绘制贝塞尔曲线
//    CGMutablePathRef path=CGPathCreateMutable();
//    CGPathMoveToPoint(path, NULL, 50, 150);//移动到起始点
//    CGPathAddCurveToPoint(path, NULL, 160, 280, -30, 300, 55, 400);//绘制二次贝塞尔曲线
//    CGContextSetLineWidth(context, 5.f);
//    CGContextDrawPath(context, kCGPathStroke);
    CGContextMoveToPoint(context, 50, 150);
    CGContextAddCurveToPoint(context, 160, 280, -30, 300, 55, 400);
    CGContextDrawPath(context, kCGPathStroke);
}


@end
