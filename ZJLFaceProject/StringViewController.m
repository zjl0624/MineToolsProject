//
//  StringViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/10/30.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "StringViewController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface StringViewController () {
	UILabel *resultLabel;
	UIButton *changeButton;
}

@end

@implementation StringViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 128, ScreenWidth, 30)];
	resultLabel.textAlignment = NSTextAlignmentCenter;
	resultLabel.text = @"www.zhidao.baidu.com";
	[self.view addSubview:resultLabel];
	
	changeButton = [UIButton buttonWithType:UIButtonTypeSystem];
	changeButton.frame = CGRectMake(0, 180, 120, 60);
	[changeButton setTitle:@"转换" forState:UIControlStateNormal];
	[self.view addSubview:changeButton];
	[changeButton addTarget:self action:@selector(changeBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
	
}


//把 "www.zhidao.baidu.com" 这样的字符串改成 "com/baidu/zhidao/www"
- (void)changeStr {
	NSArray *arr = [resultLabel.text componentsSeparatedByString:@"."];
	NSMutableArray *resultArray = [[NSMutableArray alloc] initWithArray:@[@"",@"",@"",@""]];
	[arr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		resultArray[idx] = arr[arr.count - idx - 1];
	}];
	NSString *result = [resultArray componentsJoinedByString:@"/"];
	resultLabel.text = result;
}

- (void)changeBtnClicked:(UIButton *)sender {
	[self changeStr];
}

@end
