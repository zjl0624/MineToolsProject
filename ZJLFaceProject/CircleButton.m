//
//  CircleButton.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/19.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "CircleButton.h"

@implementation CircleButton

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.frame = frame;
		self.layer.cornerRadius = CGRectGetHeight(frame)/2;
		self.backgroundColor = [UIColor redColor];
	}
	return self;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	if (self.delegate) {
		CGPoint point = [[touches anyObject] locationInView:self];
		[self.delegate moves:point];
	}
}
@end
