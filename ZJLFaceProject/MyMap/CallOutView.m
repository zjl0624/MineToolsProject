//
//  CallOutView.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/16.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "CallOutView.h"
@interface CallOutView()
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UILabel *infoLabel;
@end
@implementation CallOutView

- (void)setSelected:(BOOL)selected animated:(BOOL)animated{
	if (selected == self.selected) {
		return;
	}
	if (selected) {
		if (!_backView) {
			_backView = [[UIView alloc] initWithFrame:CGRectMake(-80, -75, 200, 70)];
			_backView.backgroundColor = [UIColor whiteColor];
			_backView.layer.borderWidth = 1;
			_backView.layer.borderColor = [UIColor blackColor].CGColor;

		}
		if (!_infoLabel) {
			_infoLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(_backView.frame), CGRectGetHeight(_backView.frame))];
			_infoLabel.textAlignment = NSTextAlignmentCenter;
			[_infoLabel setTextColor:[UIColor blackColor]];
			[_infoLabel setFont:[UIFont systemFontOfSize:15]];

		}
		[self addSubview:_backView];
		[_backView addSubview:_infoLabel];
		_infoLabel.text = self.annotation.title;
	}else {
		[self.backView removeFromSuperview];
	}
	[super setSelected:selected animated:animated];
}

@end
