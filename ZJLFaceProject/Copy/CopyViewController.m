//
//  CopyViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/10.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//
static NSNumber *a;
#import "CopyViewController.h"

@interface CopyViewController ()
@property (nonatomic,strong) NSString *strongStr;
@property (nonatomic,copy) NSString *cStr;
@end

@implementation CopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	a = @(10);
	NSLog(@"%p",a);
	a = @(20);
	NSLog(@"%p",a);
	NSMutableString *test = [NSMutableString stringWithString:@"哈哈"];
	NSString *noTest = @"hello";
	NSLog(@"%p %p",noTest,&noTest);
	self.strongStr = noTest;
	self.cStr = noTest;
	NSLog(@"%p %p",_strongStr,&_strongStr);
	NSLog(@"%p %p",_cStr,&_cStr);
	[test appendString:@"呵呵"];
	NSLog(@"%p %p",_strongStr,&_strongStr);
	NSLog(@"%p %p",_cStr,&_cStr);
	self.strongStr = @"nihao";
	NSLog(@"%p %p",test,&test);
	NSLog(@"%p %p",_strongStr,&_strongStr);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
