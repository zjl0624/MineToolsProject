//
//  ProgressSliderView.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/16.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "ProgressSliderView.h"
@interface ProgressSliderView() {
	float width;
	float height;
}


@end
@implementation ProgressSliderView

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self = [[[NSBundle mainBundle] loadNibNamed:@"ProgressSliderView" owner:self options:nil] objectAtIndex:0];
		self.frame = frame;
		[_slider addTarget:self action:@selector(finishSlide) forControlEvents:UIControlEventValueChanged];
		[_slider addObserver:self forKeyPath:@"value" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];
		_percentLabel = [[UILabel alloc] init];
		_percentLabel.font = [UIFont systemFontOfSize:11];
		_percentLabel.textAlignment = NSTextAlignmentCenter;
		_percentLabel.textColor = [UIColor blackColor];
		[self addSubview:_percentLabel];
		width = 30;
		height = 20;
	}
	return self;
}
- (void)setCurrentValue:(float)currentValue {
	[_slider setValue:currentValue animated:NO];
}

- (void)finishSlide {
	[self.delegate finishSlide:_slider.value];
}

#pragma mark - kvo
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
	[self.delegate sliding:[change[@"new"] floatValue]];
}


- (void)dealloc {
	[_slider removeObserver:self forKeyPath:@"value"];
}
@end
