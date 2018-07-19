//
//  CircleButton.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/19.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "CircleButton.h"
@interface CircleButton() {
	BOOL isClick;
}

@end
@implementation CircleButton

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self.frame = frame;
		self.layer.cornerRadius = CGRectGetHeight(frame)/2;
		self.backgroundColor = [UIColor redColor];
		[self addTarget:self action:@selector(circleButtonClicked) forControlEvents:UIControlEventTouchUpInside];
		isClick = YES;
	}
	return self;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
	isClick = NO;
	if (self.delegate) {
		CGPoint point = [[touches anyObject] locationInView:self];
		[self.delegate moves:point];
	}
}

- (void)circleButtonClicked {
	if (self.delegate && isClick == YES) {
		[self.delegate clickButton:self];
	}
	isClick = YES;
}
@end
