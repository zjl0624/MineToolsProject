//
//  CopyViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/10.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "CopyViewController.h"

@interface CopyViewController ()

@end

@implementation CopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	NSMutableString *test = [NSMutableString stringWithString:@"哈哈"];
	NSString *newStr = test;
	[test appendString:@"呵呵"];
	NSLog(@"%@",newStr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
