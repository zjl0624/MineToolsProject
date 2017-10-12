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

@end

@implementation AnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	_easyChangeView = [[UIView alloc] initWithFrame:CGRectMake(10, 74, 60, 60)];
	_easyChangeView.backgroundColor = [UIColor redColor];
	[self.view addSubview:_easyChangeView];
	UITapGestureRecognizer *easyChangeViewGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(easyAnimation:)];
	[_easyChangeView addGestureRecognizer:easyChangeViewGes];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
	
}

#pragma mark - gestureRecognizer
- (void)easyAnimation:(UITapGestureRecognizer *)tap {
	[UIView animateWithDuration:3 delay:1 options:UIViewAnimationOptionLayoutSubviews animations:^{
		_easyChangeView.transform = CGAffineTransformMakeRotation(M_PI_4);
		_easyChangeView.frame = CGRectMake(60, 74, 60, 60);
	} completion:nil];
}

@end
