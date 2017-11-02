//
//  DragViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/11/1.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "DragViewController.h"

@interface DragViewController () {
	UIButton *circleButton;
	UIPanGestureRecognizer *panGesture;
}

@end

@implementation DragViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
	circleButton = [UIButton buttonWithType:UIButtonTypeSystem];
	circleButton.frame = CGRectMake(ScreenWidth/2 - 30,(ScreenHeight - 64)/2 - 30, 60, 60);
	circleButton.layer.cornerRadius = 30;
	circleButton.backgroundColor = [UIColor redColor];
	[self.view addSubview:circleButton];
	panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
	[circleButton addGestureRecognizer:panGesture];
	[circleButton addTarget:self action:@selector(circleButtonClicked) forControlEvents:UIControlEventTouchUpInside | UIControlEventTouchUpOutside];
	
}

- (void)pan:(UIPanGestureRecognizer *)panGes {
	CGPoint p = [panGesture translationInView:self.view];
	NSLog(@"%f,%f--%f,%f",CGRectGetMinX(circleButton.frame),CGRectGetMinY(circleButton.frame),p.x,p.y);
	
	circleButton.frame = CGRectMake(CGRectGetMinX(circleButton.frame) + p.x, CGRectGetMinY(circleButton.frame) + p.y, 60, 60);
	[panGes setTranslation:CGPointZero inView:self.view];
	
}

- (void)circleButtonClicked {
	[ZJLHud showCustomHud:YES type:alertType title:@"点击了按钮"];
}

- (void)dealloc {
	
}
@end
