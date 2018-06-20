//
//  SortViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/2/25.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "SortViewController.h"

@interface SortViewController ()
@property (nonatomic,strong) UILabel *arrLabel;

@property (nonatomic,strong) UIButton *bubbleSortBtn;

@property (nonatomic,strong) UIButton *selectionSortBtn;

@property (nonatomic,strong) NSMutableArray *dataArray;
@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	_arrLabel = [[UILabel alloc] init];
	_arrLabel.frame = CGRectMake(10, 88, ScreenWidth, 30);
	_arrLabel.text = @"2,5,3,6,11,56,33,22,45,111,222,123,7";
	_dataArray = [NSMutableArray arrayWithArray:[_arrLabel.text componentsSeparatedByString:@","]];
	[self.view addSubview:_arrLabel];
	
	_bubbleSortBtn = [UIButton buttonWithType:UIButtonTypeSystem];
	[_bubbleSortBtn setTitle:@"冒泡排序" forState:UIControlStateNormal];
	_bubbleSortBtn.frame = CGRectMake(CGRectGetMinX(_arrLabel.frame), CGRectGetMaxY(_arrLabel.frame) + 10, 80, 30);
	[_bubbleSortBtn addTarget:self action:@selector(bubbleSortBtnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_bubbleSortBtn];
	
	_selectionSortBtn = [UIButton buttonWithType:UIButtonTypeSystem];
	[_selectionSortBtn setTitle:@"选择排序" forState:UIControlStateNormal];
	_selectionSortBtn.frame = CGRectMake(CGRectGetMinX(_bubbleSortBtn.frame) + 10, CGRectGetMaxY(_arrLabel.frame) + 10, 80, 30);
	[_selectionSortBtn addTarget:self action:@selector(selectionSortBtnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_selectionSortBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)bubbleSortBtnClick:(UIButton *)sender {
	NSInteger count = 0;
	NSLog(@"开始冒泡排序");
	for (int j = 0; j < _dataArray.count - 1; j++) {
		for (int i = 0; i < _dataArray.count - 1 - j; i++) {
			if ([_dataArray[i] integerValue] > [_dataArray[i + 1] integerValue]) {
				NSNumber *temp = _dataArray[i];
				_dataArray[i] = _dataArray[i + 1];
				_dataArray[i + 1] = temp;
			}
			count++;
		}
	}
	NSLog(@"冒泡排序结束");
	NSLog(@"循环次数：%ld",(long)count);
	
	_arrLabel.text = [_dataArray componentsJoinedByString:@","];
}

- (void)selectionSortBtnClick:(UIButton *)sender {
	for (int i = 0; i < _dataArray.count; i++) {
//		NSInteger min = i;
		
	}
}
@end
