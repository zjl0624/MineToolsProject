//
//  UIButton+Enlarge.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/24.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "UIButton+Enlarge.h"
#import <objc/runtime.h>
char topKey;
char leftKey;
char bottomKey;
char rightKey;
@implementation UIButton (Enlarge)

- (void)setTouchRangeWithTop:(CGFloat)top left:(CGFloat)left bottom:(CGFloat)bottom right:(CGFloat)right {
	objc_setAssociatedObject(self, &topKey, @(top), OBJC_ASSOCIATION_COPY_NONATOMIC);
	objc_setAssociatedObject(self, &leftKey, @(left), OBJC_ASSOCIATION_COPY_NONATOMIC);
	objc_setAssociatedObject(self, &bottomKey, @(bottom), OBJC_ASSOCIATION_COPY_NONATOMIC);
	objc_setAssociatedObject(self, &rightKey, @(right), OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
	CGFloat topNum = [objc_getAssociatedObject(self, &topKey) floatValue];
	CGFloat leftNum = [objc_getAssociatedObject(self, &leftKey) floatValue];
	CGFloat bottomNum = [objc_getAssociatedObject(self, &bottomKey) floatValue];
	CGFloat rightNum = [objc_getAssociatedObject(self, &rightKey) floatValue];
	CGRect range = CGRectMake(self.bounds.origin.x + leftNum, self.bounds.origin.y + topNum, self.bounds.size.width - leftNum + rightNum, self.bounds.size.height - topNum + bottomNum);
	if (CGRectContainsPoint(range, point)) {
		return self;
	}else {
		return [super hitTest:point withEvent:event];
	}
}
@end
