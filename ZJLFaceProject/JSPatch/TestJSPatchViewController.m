//
//  TestJSPatchViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/2.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "TestJSPatchViewController.h"

@interface TestJSPatchViewController ()
@property (nonatomic,strong) UIButton *testBtn;
@end

@implementation TestJSPatchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.view setBackgroundColor:[UIColor whiteColor]];
	[self initBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initBtn {
	_testBtn = [UIButton buttonWithType:UIButtonTypeSystem];
	[_testBtn setFrame:CGRectMake([UIScreen mainScreen].bounds.size.width/2 - 60, [UIScreen mainScreen].bounds.size.height/2 - 30, 120, 60)];
	[_testBtn setBackgroundColor:[UIColor redColor]];
	[_testBtn setTitle:@"修改前" forState:UIControlStateNormal];
	[_testBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[self.view addSubview:_testBtn];
	[_testBtn addTarget:self action:@selector(clickTestBtn) forControlEvents:UIControlEventTouchUpInside];
}

- (void)clickTestBtn {
	UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"你好" message:@"测试一下" preferredStyle:1];
	[self presentViewController:alert animated:YES completion:nil];
	NSOperationQueue *queue = [[NSOperationQueue alloc] init];
	[queue addOperationWithBlock:^{
		[NSThread sleepForTimeInterval:1];
		[alert dismissViewControllerAnimated:YES completion:nil];
	}];
//	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//		[alert dismissViewControllerAnimated:YES completion:nil];
//	});
}
@end
