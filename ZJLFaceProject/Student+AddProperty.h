//
//  Student+AddProperty.h
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/13.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>
@interface Student (AddProperty)
@property (nonatomic,strong) NSNumber *gender;//学生性别
@end
