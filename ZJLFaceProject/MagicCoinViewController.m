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
	[self spiltStr];
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

@end
