//
//  NetManger.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/2/26.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "NetManger.h"
#import "AFNetworking.h"
#define BaseUrl @"https://api.r6stats.com/api/v1/players/"
@implementation NetManger
static id _instance;
+ (instancetype)sharedInstance {
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_instance = [[self alloc] init];
		[_instance initManager];
	});
	return _instance;
}

- (void)initManager {
	_manager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:@""]];
	_manager.responseSerializer = [AFImageResponseSerializer serializer];
}
- (void)getWithUrl:(NSString *)url param:(NSDictionary *)param success:(void(^)(id response))success  {
//	NSString *completeUrl = [NSString stringWithFormat:@"%@",url];
	[_manager GET:@"http://cc.cocimg.com/api/uploads/20160322/1458633174180748.png" parameters:param progress:^(NSProgress * _Nonnull downloadProgress) {
		float x = (float)downloadProgress.completedUnitCount / (float)downloadProgress.totalUnitCount * 100;
		NSMutableString *str = [[NSMutableString alloc] initWithString:[NSString stringWithFormat:@"%.2f",x]];
		[str appendString:@"%"];
		NSLog(@"%@",str);
	} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		success(responseObject);
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		NSLog(@"%@",error.description);
	}];
	
}

- (void)postWithUrl:(NSString *)url param:(NSString *)param success:(void(^)(id response))success failure:(void(^)(NSString *errMsg))failure{
	[_manager POST:url parameters:param progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
		success(responseObject);
	} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
		failure(error.description);
	}];
	
	
}
@end
