//
//  UIView+CircleView.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/9/18.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "UIView+CircleView.h"

@implementation UIView (CircleView)
- (instancetype)circleView:(UIRectCorner)direction cornerRadii:(CGSize)cornerSize {
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:direction cornerRadii:cornerSize];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc]init];
    //设置大小
    maskLayer.frame = self.bounds;
    //设置图形样子
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
    return self;
}
@end
