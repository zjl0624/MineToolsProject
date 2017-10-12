//
//  CustomModel.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/15.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "CustomModel.h"

@implementation CustomModel
- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeObject:_paramA forKey:@"paramA"];
	[aCoder encodeInteger:_paramB forKey:@"paramB"];
}


- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
	if ([self init]) {
		_paramA = [aDecoder decodeObjectForKey:@"paramA"];
		_paramB = [aDecoder decodeIntegerForKey:@"paramB"];
	}
	return self;
}

- (instancetype)initWithParamA:(NSString *)paramA ParamB:(NSInteger)paramB {
	if ([super init]) {
		_paramA = paramA;
		_paramB = paramB;
	}
	return self;
}
@end
