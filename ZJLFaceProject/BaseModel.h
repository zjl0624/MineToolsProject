//
//  BaseModel.h
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/16.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseModel : NSObject
//如果model需要重新映射属性名，需要继承basemodel，然后重写该方法
//返回一个字典@{@"json字符串中的key":@"属性名"}
+ (NSDictionary *)propertyNameDic;
@end
