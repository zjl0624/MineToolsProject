//
//  CustomModel.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/15.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CustomModel : NSObject<NSCoding>

@property (nonatomic,strong) NSString *paramA;

@property (nonatomic,assign) NSInteger paramB;

- (instancetype)initWithParamA:(NSString *)paramA ParamB:(NSInteger)paramB;
@end
