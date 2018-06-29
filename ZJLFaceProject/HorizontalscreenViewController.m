//
//  HorizontalscreenViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/6/29.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "HorizontalscreenViewController.h"

@interface HorizontalscreenViewController ()<AllowRotation>
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toTopConstnt;

- (IBAction)fullScreenAction:(id)sender;
@end

@implementation HorizontalscreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self noti];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillLayoutSubviews {
	[super viewWillLayoutSubviews];
	NSLog(@"更新界面");
}
- (BOOL)prefersStatusBarHidden
{
	return NO;
}

- (BOOL)shouldAutorotate
{
	return YES;
}
- (void)noti{
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(statusBarOrientationChange:) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
}

- (void)statusBarOrientationChange:(NSNotification *)notification{
	UIInterfaceOrientation orientation = [[UIApplication sharedApplication] statusBarOrientation];
	if (orientation ==UIInterfaceOrientationLandscapeRight)// home键靠右
	{
		_toTopConstnt.constant = 44;
		NSLog(@"home键靠右");
	}
	if (orientation ==UIInterfaceOrientationLandscapeLeft)// home键靠左
	{
		_toTopConstnt.constant = 44;
		NSLog(@"home键靠左");
	}
	if (orientation ==UIInterfaceOrientationPortrait){
		_toTopConstnt.constant = 64;
		NSLog(@"竖直方向");
	}
}


-(void)willRotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation duration:(NSTimeInterval)duration {
	
}
- (IBAction)fullScreenAction:(id)sender {
//	if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)])
//	{
//		[[UIDevice currentDevice] performSelector:@selector(setOrientation:) withObject:@(UIInterfaceOrientationLandscapeRight)];
//	}
	
	NSNumber *orientationUnknown = [NSNumber numberWithInt:UIInterfaceOrientationUnknown];
	[[UIDevice currentDevice] setValue:orientationUnknown forKey:@"orientation"];
	
	NSNumber *orientationTarget = [NSNumber numberWithInt:UIInterfaceOrientationLandscapeRight];
	[[UIDevice currentDevice] setValue:orientationTarget forKey:@"orientation"];
}
@end
