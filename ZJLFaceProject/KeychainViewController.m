//
//  KeychainViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/2.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "KeychainViewController.h"
#import "KeychainTools.h"
#import "ZJLHud.h"

@interface KeychainViewController ()
@property (nonatomic,strong) UIButton *readBtn;
@property (nonatomic,strong) UIButton *writeBtn;

@end

@implementation KeychainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	_readBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 100, 60, 30)];
	[_readBtn setTitle:@"读数据" forState:UIControlStateNormal];
	[_readBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[self.view addSubview:_readBtn];
	[_readBtn addTarget:self action:@selector(clickReadBtn) forControlEvents:UIControlEventTouchUpInside];
	
	_writeBtn = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_readBtn.frame) + 20, 100, 60, 30)];
	[_writeBtn setTitle:@"写数据" forState:UIControlStateNormal];
	[_writeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[self.view addSubview:_writeBtn];
	[_writeBtn addTarget:self action:@selector(clickWriteBtn) forControlEvents:UIControlEventTouchUpInside];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clickReadBtn {
	NSString *pwd = (NSString *)[KeychainTools load:@"password"];
	[ZJLHud showCustomHud:YES type:0 title:pwd];
}


- (void)clickWriteBtn {
	NSString *pwd = @"Aa123456";
	[KeychainTools save:@"password" data:pwd];
}
@end
