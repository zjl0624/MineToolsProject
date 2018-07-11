//
//  AnimationViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/11.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "AnimationViewController.h"

@interface AnimationViewController ()
@property (strong, nonatomic)  UIView *easyChangeView;
@property (strong,nonatomic) UIView *centerView;

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	_easyChangeView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 50)];
	_easyChangeView.backgroundColor = [UIColor redColor];
	[self.view addSubview:_easyChangeView];
	UITapGestureRecognizer *easyChangeViewGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(easyAnimation:)];
	[_easyChangeView addGestureRecognizer:easyChangeViewGes];
	_centerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
	_centerView.backgroundColor = [UIColor yellowColor];
	[_easyChangeView addSubview:_centerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
	
}

#pragma mark - gestureRecognizer
- (void)easyAnimation:(UITapGestureRecognizer *)tap {
	[UIView animateWithDuration:5 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
		_easyChangeView.transform = CGAffineTransformMakeRotation(M_PI_2);
		_easyChangeView.frame = CGRectMake(0, 0, 50, [UIScreen mainScreen].bounds.size.height);
		_easyChangeView.backgroundColor = [UIColor blackColor];
	} completion:nil];
}

@end
