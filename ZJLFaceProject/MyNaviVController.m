//
//  MyNaviVController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/6/29.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "MyNaviVController.h"


@interface MyNaviVController ()

@end

@implementation MyNaviVController

- (void)viewDidLoad {
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)shouldAutorotate
{
	if ([self.topViewController conformsToProtocol:@protocol(AllowRotation)]) {
		return YES;
	}else {
		return NO;
	}}



@end
