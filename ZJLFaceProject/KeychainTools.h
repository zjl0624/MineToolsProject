//
//  KeychainTools.h
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/2.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeychainTools : NSObject
+ (void)save:(NSString *)service data:(id)data;

+ (id)load:(NSString *)service;

+ (void)deleteKeyData:(NSString *)service;
@end
