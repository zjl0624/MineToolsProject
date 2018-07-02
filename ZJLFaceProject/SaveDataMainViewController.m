//
//  SaveDataMainViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/15.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "SaveDataMainViewController.h"
#import "UserDefaultViewController.h"
#import "SQLiteViewController.h"
#import "ArchiverViewController.h"
#import "KeychainViewController.h"

@interface SaveDataMainViewController ()<UITableViewDelegate,UITableViewDataSource> {
	UITableView *tableview;
	NSMutableArray *dataArray;
}

@end

@implementation SaveDataMainViewController

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
			vc = [[UserDefaultViewController alloc] init];
			break;
		case 1:
			vc = [[SQLiteViewController alloc] init];
			break;
		case 2:
			vc = [[ArchiverViewController alloc] init];
			break;
		case 3:
			vc = [[KeychainViewController alloc] init];
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
	[dataArray addObject:@"Userdefaults"];
	[dataArray addObject:@"数据库"];
	[dataArray addObject:@"对象序列化"];
	[dataArray addObject:@"Keychain"];
	
}
@end
