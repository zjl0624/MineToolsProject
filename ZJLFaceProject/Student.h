//
//  Student.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,StuSex){
	man,
	woman
};
@interface Student : NSObject

@property (nonatomic,strong) NSString *name;

@property (nonatomic,assign) NSInteger sex;

@property (nonatomic,assign) NSInteger age;

@property (nonatomic,strong) NSArray *course;

@end

@interface Course : NSObject

@property (nonatomic,strong) NSString *name;

@property (nonatomic,assign) NSInteger score;

@end
