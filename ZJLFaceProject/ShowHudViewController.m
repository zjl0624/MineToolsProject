//
//  ShowHudViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/11/1.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "ShowHudViewController.h"
#import "ZJLHud.h"
@interface ShowHudViewController () {
	UIButton *alertHudButton;
}

@end

@implementation ShowHudViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	[self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initUI {
	alertHudButton = [UIButton buttonWithType:UIButtonTypeSystem];
	alertHudButton.frame = CGRectMake(0, 64, 120, 30);
	[alertHudButton setTitle:@"弹出提示框" forState:UIControlStateNormal];
	[alertHudButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[self.view addSubview:alertHudButton];
	[alertHudButton addTarget:self action:@selector(alertHudBtnClicked) forControlEvents:UIControlEventTouchUpInside];
}

- (void)alertHudBtnClicked {
	[ZJLHud showCustomHud:YES type:alertType title:@"哈哈"];
}
@end
