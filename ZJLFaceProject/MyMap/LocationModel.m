//
//  LocationModel.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/11/7.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "LocationModel.h"

@implementation LocationModel
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:_detail forKey:@"detail"];
    [aCoder encodeObject:_dateStr forKey:@"dateStr"];
    [aCoder encodeBool:_isBackground forKey:@"isBackground"];
}


- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
    if ([self init]) {
        _detail = [aDecoder decodeObjectForKey:@"detail"];
        _dateStr = [aDecoder decodeObjectForKey:@"dateStr"];
        _isBackground = [aDecoder decodeBoolForKey:@"isBackground"];
    }
    return self;
}
@end
