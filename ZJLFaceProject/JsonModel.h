//
//  JsonModel.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/13.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Data;
@interface JsonModel : NSObject
@property (nonatomic,strong) NSString *Code;

@property (nonatomic,strong) NSString *Msg;

@property (nonatomic,strong) NSArray<Data *> *Data;
@end

@interface Data : NSObject
@property (nonatomic,strong) NSString *userId;

@property (nonatomic,strong) NSString *bookName;
@end
