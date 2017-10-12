//
//  KVCViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "KVCViewController.h"
#import "Student.h"

@interface KVCViewController ()

@end

@implementation KVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self changeValue];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


#pragma mark - private method
- (void)changeValue {
	Student *stu = [[Student alloc] init];
	[stu setValue:@"哈哈" forKey:@"name"];
	[stu setValue:@20 forKey:@"age"];
	[stu setValue:@(woman) forKey:@"sex"];
	NSLog(@"%@,%@,%@",[stu valueForKey:@"name"],[stu valueForKey:@"age"],[stu valueForKey:@"sex"]);
	
	Course *yuwen = [[Course alloc] init];
	yuwen.name = @"语文";
	yuwen.score = 90;
	
	Course *shuxue = [[Course alloc] init];
	shuxue.name = @"数学";
	shuxue.score = 80;
	
	NSArray *couresArray = @[yuwen,shuxue];
	[stu setValue:couresArray forKey:@"course"];
	
	for (NSString *name in [stu valueForKeyPath:@"course.name"]) {
		NSLog(@"%@ ",name);
	}
	
	for (id score in [stu valueForKeyPath:@"course.score"]) {
		NSLog(@"%@",score);
	}
	
	NSLog(@"%@",[stu valueForKeyPath:@"course.@sum.score"]);
	NSLog(@"%@",[stu valueForKeyPath:@"course.@avg.score"]);
	NSLog(@"%@",[stu valueForKeyPath:@"course.@count"]);
	NSLog(@"%@",[stu valueForKeyPath:@"course.@max.score"]);
	NSLog(@"%@",[stu valueForKeyPath:@"course.@min.score"]);
	
}
@end
