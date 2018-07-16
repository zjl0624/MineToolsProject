//
//  JsonModel.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/13.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "JsonModel.h"

@implementation JsonModel
+ (NSDictionary *)propertyNameDic {
	return @{@"Content":@"Con",@"Data":@"Da"};
}
@end


@implementation Data
+ (NSDictionary *)propertyNameDic {
	return @{@"userId":@"usrId",@"bookName":@"book"};
}
@end


@implementation Content

@end
