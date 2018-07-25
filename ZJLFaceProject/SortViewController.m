//
//  SortViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/2/25.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "SortViewController.h"

@interface SortViewController ()
@property (nonatomic,strong) UITextView *arrLabel;

@property (nonatomic,strong) UIButton *bubbleSortBtn;

@property (nonatomic,strong) UIButton *selectionSortBtn;

@property (nonatomic,strong) UIButton *quickSortBtn;

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation SortViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	_arrLabel = [[UITextView alloc] init];
	_arrLabel.frame = CGRectMake(10, 88, ScreenWidth - 20, 200);
	_arrLabel.font = [UIFont systemFontOfSize:18];
	_dataArray = [[NSMutableArray alloc] init];
	[self getRandomNum:10];
	_arrLabel.text = [_dataArray componentsJoinedByString:@","];

	[self.view addSubview:_arrLabel];
	
	_bubbleSortBtn = [UIButton buttonWithType:UIButtonTypeSystem];
	[_bubbleSortBtn setTitle:@"冒泡排序" forState:UIControlStateNormal];
	_bubbleSortBtn.frame = CGRectMake(CGRectGetMinX(_arrLabel.frame), CGRectGetMaxY(_arrLabel.frame) + 10, 80, 30);
	[_bubbleSortBtn addTarget:self action:@selector(bubbleSortBtnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_bubbleSortBtn];
	
	_selectionSortBtn = [UIButton buttonWithType:UIButtonTypeSystem];
	[_selectionSortBtn setTitle:@"选择排序" forState:UIControlStateNormal];
	_selectionSortBtn.frame = CGRectMake(CGRectGetMaxX(_bubbleSortBtn.frame) + 10, CGRectGetMaxY(_arrLabel.frame) + 10, 80, 30);
	[_selectionSortBtn addTarget:self action:@selector(selectionSortBtnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_selectionSortBtn];
	
	_quickSortBtn = [UIButton buttonWithType:UIButtonTypeSystem];
	[_quickSortBtn setTitle:@"快速排序" forState:UIControlStateNormal];
	_quickSortBtn.frame = CGRectMake(CGRectGetMaxX(_selectionSortBtn.frame) + 10, CGRectGetMaxY(_arrLabel.frame) + 10, 80, 30);
	[_quickSortBtn addTarget:self action:@selector(quickSortBtnClick:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:_quickSortBtn];
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
	for (NSInteger i = 0; i < _dataArray.count; i++) {
		NSInteger minIndex = i;
		NSNumber *min = _dataArray[i];
		for (NSInteger j = i; j < _dataArray.count; j++) {
			if (_dataArray[j] < min) {
				minIndex = j;
				min = _dataArray[j];
			}
		}
		NSNumber *temp = _dataArray[i];
		_dataArray[i] = _dataArray[minIndex];
		_dataArray[minIndex] = temp;
	}
	_arrLabel.text = [_dataArray componentsJoinedByString:@","];
}


- (void)quickSortBtnClick:(UIButton *)sender {
	[self quickSortWithLeft:0 right:_dataArray.count - 1];
	_arrLabel.text = [_dataArray componentsJoinedByString:@","];
}

- (void)quickSortWithLeft:(NSInteger)left right:(NSInteger)right {
	if (left > right) {
		return;
	}
	NSInteger temp = [_dataArray[left] integerValue];
	NSInteger i = left;
	NSInteger j = right;
	for (j = right; j > i; j--) {
		if ([_dataArray[j] integerValue] < temp) {
			for (i = i; i < j; i++) {
				if ([_dataArray[i] integerValue] > temp) {
					NSNumber *x = _dataArray[i];
					_dataArray[i] = _dataArray[j];
					_dataArray[j] = x;
					break;
				}
			}
		}
	}
	_dataArray[left] = _dataArray[i];
	_dataArray[i] = @(temp);
	[self quickSortWithLeft:left right:i - 1];
	[self quickSortWithLeft:i + 1 right:right];
}
- (void)getRandomNum:(NSInteger)n {
	[_dataArray removeAllObjects];
	for (int i = 0; i < n; i++) {
		NSNumber *num = [NSNumber numberWithInt:(arc4random() % 100) + 1];
		[_dataArray addObject:num];
	}
}
@end
