//
//  JsonToModelViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/13.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "JsonToModelViewController.h"
#import "NSObject+SwithToModel.h"
#import "JsonModel.h"

@interface JsonToModelViewController ()<UITableViewDataSource,UITableViewDelegate>{
	UITableView *tableview;
	NSMutableArray *dataArray;
	UITextView *textView;
}

@end

@implementation JsonToModelViewController

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
}

#pragma mark - Init UI
- (void)initTableview {
	tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
	[self.view addSubview:tableview];
	tableview.tableHeaderView = [self createTableHeaderView];
	tableview.delegate = self;
	tableview.dataSource = self;
	dataArray = [[NSMutableArray alloc] init];
}

- (UIView *)createTableHeaderView {
	UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
	
	UILabel *tipsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(headerView.frame), 30)];
	tipsLabel.font = [UIFont systemFontOfSize:14];
	tipsLabel.text = @"请在下面的文本框中输入一个json字符串，然后点确定";
	[headerView addSubview:tipsLabel];
	
	textView = [[UITextView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(tipsLabel.frame) + 5, CGRectGetWidth(tipsLabel.frame) - 60, 165)];
	[headerView addSubview:textView];
	
	UIButton *sureButton = [UIButton buttonWithType:UIButtonTypeSystem];
	[sureButton setTitle:@"确定" forState:UIControlStateNormal];
	sureButton.frame = CGRectMake(CGRectGetMaxX(textView.frame), CGRectGetMaxY(textView.frame) - 30, 60, 30);
	[sureButton addTarget:self action:@selector(sureButtonClick:) forControlEvents:UIControlEventTouchUpInside];
	[headerView addSubview:sureButton];
	return headerView;
}

#pragma mark - Button Action
- (void)sureButtonClick:(UIButton *)sender {
	[textView resignFirstResponder];
	if ([textView.text isEqualToString:@""]) {

	}
	JsonModel *model = [[JsonModel alloc] init];
	model = [model jsonToModel:textView.text];
}
@end
