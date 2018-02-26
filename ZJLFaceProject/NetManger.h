//
//  NetManger.h
//  ZJLFaceProject
//
//  Created by zjl on 2018/2/26.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>
@class AFHTTPSessionManager;
@interface NetManger : NSObject
@property (nonatomic,strong) AFHTTPSessionManager *manager;

+ (instancetype)sharedInstance;

- (void)getWithUrl:(NSString *)url param:(NSDictionary *)param success:(void(^)(id response))success;

- (void)postWithUrl:(NSString *)url param:(NSString *)param success:(void(^)(id response))success failure:(void(^)(NSString *errMsg))failure;
@end
