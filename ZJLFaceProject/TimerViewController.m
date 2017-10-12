//
//  TimerViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()<UITableViewDelegate,UITableViewDataSource>{
	UITableView *tableview;
	NSMutableArray *dataArray;
	NSTimer *timer;
	 int num;
}

@end

@implementation TimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self initTableview];
}


- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	[timer invalidate];
	timer = nil;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifer = @"cell";
	UITableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:cellIdentifer];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
	}
	cell.textLabel.text = [NSString stringWithFormat:@"%d",num];
	return cell;
}

#pragma mark - Init UI
- (void)initTableview {
	tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
	[self.view addSubview:tableview];
	tableview.delegate = self;
	tableview.dataSource = self;
	dataArray = [[NSMutableArray alloc] init];
	timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
		num++;
		[tableview reloadData];
	}];
	[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}


- (void)dealloc {

}

@end
