//
//  KVOModel.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KVOModel : NSObject

@property (nonatomic,strong) NSString *text;

@property (nonatomic,strong) NSMutableArray *array;

- (void)changeText:(NSString *)text;

+ (instancetype)sharedKVOModel;
@end
