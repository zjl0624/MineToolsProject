//
//  GCDSyncQueueViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/6/27.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "GCDSyncQueueViewController.h"

@interface GCDSyncQueueViewController ()

@end

@implementation GCDSyncQueueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.view.backgroundColor = [UIColor whiteColor];
	[self sync];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)sync {
	NSLog(@"%d",1);
//	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

	dispatch_sync(dispatch_get_main_queue(), ^{
		NSLog(@"%d",2);
	});
	NSLog(@"%d",3);
	
}

@end
