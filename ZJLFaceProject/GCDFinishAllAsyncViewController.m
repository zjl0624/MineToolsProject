//
//  GCDFinishAllAsyncViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "GCDFinishAllAsyncViewController.h"
void(^finishBlock)(void);

@interface GCDFinishAllAsyncViewController () {
	BOOL first;
	BOOL second;
	BOOL third;
}
@end

@implementation GCDFinishAllAsyncViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
	dispatch_group_t group = dispatch_group_create();
	dispatch_group_async(group, queue, ^{
		sleep(1);
		first = YES;
		NSLog(@"第一个完成");
	});
	dispatch_group_async(group, queue, ^{
		sleep(2);
		second = YES;
		NSLog(@"第二个完成");
	});
	dispatch_group_async(group, queue, ^{
		sleep(3);
		third = YES;
		NSLog(@"第三个完成");
	});
//	dispatch_group_notify(group, dispatch_get_main_queue(), ^{
//		[self FinishAll];
//	});
	__weak GCDFinishAllAsyncViewController *weakself = self;
	finishBlock = ^(){
		[weakself FinishAll];
	};
	dispatch_group_notify(group, dispatch_get_main_queue(), finishBlock);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)FinishAll {
	NSLog(@"first = %@ second = %@ third = %@",@(first),@(second),@(third));

}

- (void)dealloc {
	NSLog(@"%@释放",[self class]);
}
@end
