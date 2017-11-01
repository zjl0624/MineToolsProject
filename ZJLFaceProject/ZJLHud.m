//
//  ZJLHud.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/11/1.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "ZJLHud.h"
#import "CustomHudView.h"
#import "AppDelegate.h"
@implementation ZJLHud
+ (void)showCustomHud:(BOOL)isAutoClose type:(HudType)type title:(NSString *)title{
	[[CustomHudView sharedInstance] configureViewWithTitle:title];
	[((AppDelegate *)[[UIApplication sharedApplication] delegate]).window addSubview:[CustomHudView sharedInstance]];
	if (isAutoClose) {
		dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
			[self closeHud];
		});
	}
}

+ (void)closeHud {
	[UIView animateWithDuration:0.5 animations:^{
		[CustomHudView sharedInstance].alpha = 0;
	} completion:^(BOOL finished) {
		[[CustomHudView sharedInstance] removeFromSuperview];
	}];
	
}
@end
