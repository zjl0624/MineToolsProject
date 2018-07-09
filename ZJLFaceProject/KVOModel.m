//
//  KVOModel.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "KVOModel.h"

@implementation KVOModel
static id _instance;
+ (instancetype)sharedKVOModel
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_instance = [[self alloc] init];
	});
	return _instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{   //onceToken是GCD用来记录是否执行过 ，如果已经执行过就不再执行(保证执行一次）
		_instance = [super allocWithZone:zone];
	});
	return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
	return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
	return _instance;
}

- (void)changeText:(NSString *)text {
	_text = text;
}

- (void)setText:(NSString *)text {
	_text = text;
}
@end
