//
//  CustomHudView.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/11/1.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "CustomHudView.h"
int  HudWidth = 120;
int  HudHeight = 60;
static id _instance;
@interface CustomHudView() {
	UILabel *titleLabel;
}
@end
@implementation CustomHudView
+ (instancetype)sharedInstance
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_instance = [[self alloc] init];
	});
	return _instance;
}

- (void)configureViewWithTitle:(NSString *)title {
	self.frame = CGRectMake(ScreenWidth/2 - HudWidth/2, (ScreenHeight - 64)/2 - HudHeight/2, HudWidth, HudHeight);
	self.backgroundColor = [UIColor blackColor];
	self.layer.cornerRadius = HudHeight/4;
	self.alpha = 0.4;
	titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, HudWidth, HudHeight)];
	titleLabel.text = title;
	titleLabel.textColor = [UIColor whiteColor];
	titleLabel.textAlignment = NSTextAlignmentCenter;
	[self addSubview:titleLabel];
}
@end
