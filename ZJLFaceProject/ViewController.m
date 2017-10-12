//
//  ViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/13.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "ViewController.h"
#import "JsonToModelViewController.h"
#import "KVCViewController.h"
#import "KVOViewController.h"
#import "TimerViewController.h"
#import "GCDMainViewController.h"
#import "SaveDataMainViewController.h"
#import "PassValueViewController.h"
#import "TableViewController.h"
#import "AnimationViewController.h"
#import "ReaderViewController.h"
#import "TestScrollerViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource> {
	UITableView *tableview;
	NSMutableArray *dataArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	[self initTableview];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	
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
			vc = [[JsonToModelViewController alloc] init];
			break;
		case 1:
			vc = [[KVCViewController alloc] init];
			break;
		case 2:
			vc = [[KVOViewController alloc] init];
			break;
		case 3:
			vc = [[TimerViewController alloc] init];
			break;
		case 4:
			vc= [[GCDMainViewController alloc] init];
			break;
		case 5:
			vc = [[SaveDataMainViewController alloc] init];
			break;
		case 6:
			vc = [[PassValueViewController alloc] init];
			break;
		case 7:
			vc = [[TableViewController alloc] init];
			break;
		case 8:
			vc = [[AnimationViewController alloc] initWithNibName:@"AnimationViewController"bundle:nil];
			break;
		case 9:
			vc = [[ReaderViewController alloc] init];
			break;
		case 10:
			vc = [[TestScrollerViewController alloc] init];
			break;
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
	[dataArray addObject:@"json转对象"];
	[dataArray addObject:@"KVC"];
	[dataArray addObject:@"KVO"];
	[dataArray addObject:@"Timer"];
	[dataArray addObject:@"GCD"];
	[dataArray addObject:@"各种数据存储方式"];
	[dataArray addObject:@"三种页面间传值方式"];
	[dataArray addObject:@"分离datasource"];
	[dataArray addObject:@"动画"];
	[dataArray addObject:@"阅读器"];
	[dataArray addObject:@"测试scroller的滚动"];
}

@end
