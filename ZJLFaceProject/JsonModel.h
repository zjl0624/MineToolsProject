//
//  JsonModel.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/13.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseModel.h"

@class Data;
@class Content;

@interface JsonModel : NSObject
@property (nonatomic,strong) NSString *Code;

@property (nonatomic,strong) NSString *Msg;

@property (nonatomic,strong) NSArray<Data *> *Data;

@property (nonatomic,strong) Content *Content;
@end

@interface Data : BaseModel
@property (nonatomic,strong) NSString *usrId;

@property (nonatomic,strong) NSString *bookName;
@end

@interface Content : NSObject
@property (nonatomic,strong) NSString *author;

@property (nonatomic,strong) NSString *age;
@end
