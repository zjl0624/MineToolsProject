//
//  MagicCoinViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/2/23.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "MagicCoinViewController.h"

@interface MagicCoinViewController ()

@end

@implementation MagicCoinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	[self lastWordLength];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - private method

/*
 题目描述
 •连续输入字符串，请按长度为8拆分每个字符串后输出到新的字符串数组；
 •长度不是8整数倍的字符串请在后面补数字0，空字符串不处理。
 输入描述:
 连续输入字符串(输入2次,每个字符串长度小于100)
 输出描述:
 输出到长度为8的新字符串数组
 示例1
 输入
 
 复制
 abc
 123456789
 输出
 
 复制
 abc00000
 12345678
 90000000
 */
- (void)spiltStr{
	NSString *str1 = @"sdafwiuiuiuiujjojo";
	NSString *str2 = @"mijimionueqoruqyrpqjknvhihijiofqyoei";
	for (int i = 0; i < str1.length; i=i+8) {
		if (str1.length - i > 8) {
			printf("%s\n",[[str1 substringWithRange:NSMakeRange(i, 8)] UTF8String]);
		}else {
			printf("%s",[[str1 substringWithRange:NSMakeRange(i, str1.length - i)] UTF8String]);
			for (int j = 0; j < 8 - str1.length + i; j++) {
				if (j == 8 - str1.length + i - 1) {
					printf("%d\n",0);
				}else {
					printf("%d",0);
				}
				
			}
		}
	}
	
	for (int i = 0; i < str2.length; i=i+8) {
		if (str2.length - i > 8) {
			printf("%s\n",[[str2 substringWithRange:NSMakeRange(i, 8)] UTF8String]);
		}else {
			printf("%s",[[str2 substringWithRange:NSMakeRange(i, str2.length - i)] UTF8String]);
			for (int j = 0; j < 8 - str2.length + i; j++) {
				if (j == 8 - str2.length + i - 1) {
					printf("%d\n",0);
				}else {
					printf("%d",0);
				}
				
			}
		}
	}
}


/*
 题目描述
 明明想在学校中请一些同学一起做一项问卷调查，为了实验的客观性，他先用计算机生成了N个1到1000之间的随机整数（N≤1000），对于其中重复的数字，只保留一个，把其余相同的数去掉，不同的数对应着不同的学生的学号。然后再把这些数从小到大排序，按照排好的顺序去找同学做调查。请你协助明明完成“去重”与“排序”的工作。
 
 
 Input Param
 n               输入随机数的个数
 inputArray      n个随机整数组成的数组
 
 Return Value
 OutputArray    输出处理后的随机整数
 
 
 注：测试用例保证输入参数的正确性，答题者无需验证。测试用例不止一组。
 
 
 
 输入描述:
 输入多行，先输入随机整数的个数，再输入相应个数的整数
 输出描述:
 返回多行，处理后的结果
 示例1
 输入
 
 复制
 11
 10
 20
 40
 32
 67
 40
 20
 89
 300
 400
 15
 输出
 
 复制
 10
 15
 20
 32
 40
 67
 89
 300
 400*/

- (void)randomNum {
	int n = 20;
	int i = 0;
	NSMutableArray *arr = [[NSMutableArray alloc] init];
	while (i < n) {
		[arr addObject:@((arc4random() % 1000) + 1)];
		i++;
	}

	NSMutableDictionary *dic = [[NSMutableDictionary alloc] init];
	for (id obj in arr) {
		[dic setObject:obj forKey:obj];
	}
//	[dic keysSortedByValueWithOptions:0 usingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
//		NSNumber *number1 = obj1;
//		NSNumber *number2 = obj2;
//
//		NSComparisonResult result = [number1 compare:number2];
//
//		return result == NSOrderedDescending; // 升序
//	}];
	NSMutableArray *resultArr = [[dic allKeys] mutableCopy];
	NSInteger count = 0;
//	int x = 0;
//	int y = 0;
	for (int y = 0 ; y < resultArr.count - 1; y++) {
		for (int x = 0 ; x < resultArr.count - 1 - y; x++) {
			if ([resultArr objectAtIndex:x] > [resultArr objectAtIndex:x + 1]) {
				NSNumber *temp = [resultArr objectAtIndex:x];
				[resultArr replaceObjectAtIndex:x withObject:[resultArr objectAtIndex:x + 1]];
				[resultArr replaceObjectAtIndex:x + 1 withObject:temp];
				
			}
			count++;
		}
	}
	for (NSNumber *num in resultArr) {
		printf("%d\n",[num intValue]);
	}
	
}

/*
 题目描述
 计算字符串最后一个单词的长度，单词以空格隔开。
 输入描述:
 一行字符串，非空，长度小于5000。
 输出描述:
 整数N，最后一个单词的长度。
 示例1
 输入
 
 复制
 hello world
 输出
 
 复制
 5
 */
- (void)lastWordLength {
	NSString *str = @"hello world dffdff   ewerwr";
	NSArray *strArr = [str componentsSeparatedByString:@" "];
	printf("%lu",(unsigned long)[[NSString stringWithFormat:@"%@",[strArr lastObject]] length]);
}
@end
