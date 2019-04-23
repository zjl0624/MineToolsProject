//
//  GCDMainViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "GCDMainViewController.h"
#import "GCDFinishAllAsyncViewController.h"
#import "GCDSyncQueueViewController.h"
#import "GCDAsyncQueueViewController.h"
#import "UseQueueViewController.h"

@interface GCDMainViewController ()<UITableViewDelegate,UITableViewDataSource> {
	UITableView *tableview;
	NSMutableArray *dataArray;
}

@end

@implementation GCDMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self initTableview];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *cellIdentifer = @"cell";
	UITableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:cellIdentifer];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifer];
	}
	cell.textLabel.text = dataArray[indexPath.row];
	return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UIViewController *vc;
	switch (indexPath.row) {
		case 0:
			vc = [[GCDFinishAllAsyncViewController alloc] init];
			break;
		case 1:
			vc = [[GCDSyncQueueViewController alloc] init];
			break;
		case 2:
			vc = [[GCDAsyncQueueViewController alloc] init];
			break;
        case 3:
            vc = [[UseQueueViewController alloc] init];
		default:
			break;
	}
	[self.navigationController pushViewController:vc animated:YES];
}
#pragma mark - Init UI
- (void)initTableview {
	tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
	[self.view addSubview:tableview];
	tableview.delegate = self;
	tableview.dataSource = self;
	dataArray = [[NSMutableArray alloc] init];
	[dataArray addObject:@"多个异步请求全部执行完成"];
	[dataArray addObject:@"串行队列"];
	[dataArray addObject:@"并行队列"];
    [dataArray addObject:@"自定义队列"];
}

@end
