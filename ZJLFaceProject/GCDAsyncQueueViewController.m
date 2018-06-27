//
//  GCDAsyncQueueViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/6/27.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "GCDAsyncQueueViewController.h"

@interface GCDAsyncQueueViewController ()

@end

@implementation GCDAsyncQueueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self async];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)async {
	NSLog(@"%d",1);
	dispatch_async(dispatch_get_main_queue(), ^{
		NSLog(@"%d",2);
	});
	NSLog(@"%d",3);
}

@end
