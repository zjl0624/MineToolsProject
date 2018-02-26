//
//  UseAFNetworkingViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/2/26.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "UseAFNetworkingViewController.h"
#import "NetManger.h"

@interface UseAFNetworkingViewController ()

@end

@implementation UseAFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[[NetManger sharedInstance] getWithUrl:@"xiaoligehaha?platform=uplay" param:nil success:^(id response) {
		NSLog(@"%@",response);
	}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
