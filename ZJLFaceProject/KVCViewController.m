//
//  KVCViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "KVCViewController.h"
#import "Student.h"
#import "Student+AddProperty.h"

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
	stu.gender = @(2);
	NSLog(@"%@,%@,%@,%@",[stu valueForKey:@"name"],[stu valueForKey:@"age"],[stu valueForKey:@"sex"],stu.gender);
	
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
	
	int isSuccess = [stu performSelector:@selector(eat) withObject:@"hh" withObject:@"xx"];
	
	NSMethodSignature *sign = [Student instanceMethodSignatureForSelector:@selector(eat)];
	NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sign];
	invocation.selector = @selector(eat);
	[invocation setTarget:stu];
	NSString *paramA = @"你好";
	NSString *paramB = @"拉阿拉";
	[invocation setArgument:&paramA atIndex:2];
	[invocation setArgument:&paramB atIndex:3];
	[invocation retainArguments];
	[invocation invoke];
	[invocation getReturnValue:&isSuccess];
	

	
}
@end
