//
//  CALyerViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/10.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "CALyerViewController.h"

@interface CALyerViewController () {
	CALayer *oneLayer;
}
@property (nonatomic,strong) UIButton *button;
@end

@implementation CALyerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	oneLayer = [[CALayer alloc] init];
	oneLayer.position = CGPointMake(10, 98);
	oneLayer.anchorPoint = CGPointZero;
	oneLayer.bounds = CGRectMake(0, 0, 50, 50);
	oneLayer.backgroundColor = [UIColor redColor].CGColor;
	[self.view.layer addSublayer:oneLayer];
	
	_button = [UIButton buttonWithType:UIButtonTypeSystem];
	[_button setTitle:@"开始" forState:UIControlStateNormal];
	_button.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 60, ([UIScreen mainScreen].bounds.size.height - 64)/2 - 30, 120, 60);
	[self.view addSubview:_button];
	[_button addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickBtn {
	[CATransaction begin];
	[CATransaction setAnimationDuration:3];
	oneLayer.position = CGPointMake(100, 300);
	oneLayer.backgroundColor = [UIColor yellowColor].CGColor;
	oneLayer.cornerRadius = 15;
	[CATransaction commit];
}

@end
