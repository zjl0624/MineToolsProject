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
	CAGradientLayer *gLayer;
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
	
	gLayer = [CAGradientLayer layer];
	gLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor,(__bridge id)[UIColor greenColor].CGColor];
	gLayer.locations = @[@0.1,@0.2,@0.3,@0.4];
	gLayer.startPoint = CGPointZero;
	gLayer.endPoint = CGPointMake(1.0, 0);
	gLayer.position = CGPointMake(10, 450);
	gLayer.anchorPoint = CGPointZero;
	gLayer.bounds = CGRectMake(0, 0, 200, 50);
	[self.view.layer addSublayer:gLayer];
	
	
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
//	[CATransaction setDisableActions:YES];
	[CATransaction setDisableActions:NO];
	[CATransaction begin];
	[CATransaction setAnimationDuration:3];
	oneLayer.position = CGPointMake(100, 300);
	oneLayer.backgroundColor = [UIColor yellowColor].CGColor;
	oneLayer.cornerRadius = 15;
	gLayer.colors = @[(__bridge id)[UIColor greenColor].CGColor,(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
	gLayer.locations = @[@0.4,@0.5,@0.6,@0.7];
	[CATransaction commit];
}

@end
