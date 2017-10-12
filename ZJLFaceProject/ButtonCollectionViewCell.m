//
//  ButtonCollectionViewCell.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/8.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "ButtonCollectionViewCell.h"
@interface ButtonCollectionViewCell (){
	UIButton *button;
}

@end
@implementation ButtonCollectionViewCell
- (void)configureCell:(NSString *)title {
	self.backgroundColor = [UIColor redColor];
	button = [UIButton buttonWithType:UIButtonTypeSystem];
	button.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
	[button setTitle:title forState:UIControlStateNormal];
	[button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self addSubview:button];
}

- (void)btnClick:(UIButton *)sender {
	[self.delegate clickButton:self sender:sender];
}
@end
