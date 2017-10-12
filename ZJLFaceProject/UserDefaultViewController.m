//
//  UserDefaultViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/15.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "UserDefaultViewController.h"

@interface UserDefaultViewController () {
	UILabel *resultLabel;
}

@end

@implementation UserDefaultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[[NSUserDefaults standardUserDefaults] setObject:@"哈哈" forKey:@"userdefaults"];
	[[NSUserDefaults standardUserDefaults] synchronize];
	resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 80, 100, 50)];
	resultLabel.text = [[NSUserDefaults standardUserDefaults] stringForKey:@"userdefaults"];
	[self.view addSubview:resultLabel];
	self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
