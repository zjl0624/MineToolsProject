//
//  BaseViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/11/1.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
		self.navigationController.interactivePopGestureRecognizer.enabled = NO;
	}
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
