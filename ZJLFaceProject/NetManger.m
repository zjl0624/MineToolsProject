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
	_manager.requestSerializer = [AFHTTPRequestSerializer serializer];
	_manager.responseSerializer = [AFHTTPResponseSerializer serializer];
	if (self.isUseHttps) {
		_manager.securityPolicy = [self customSecurityPolicy];
	}
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

- (AFSecurityPolicy *)customSecurityPolicy
{
	//先导入证书，找到证书的路径
	NSString *cerPath = [[NSBundle mainBundle] pathForResource:@"这是你证书的名字（不是域名）" ofType:@"cer"];
	NSData *certData = [NSData dataWithContentsOfFile:cerPath];
	
	//AFSSLPinningModeCertificate 使用证书验证模式
	AFSecurityPolicy *securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
	
	//allowInvalidCertificates 是否允许无效证书（也就是自建的证书），默认为NO
	//如果是需要验证自建证书，需要设置为YES
	securityPolicy.allowInvalidCertificates = YES;
	
	//validatesDomainName 是否需要验证域名，默认为YES；
	//假如证书的域名与你请求的域名不一致，需把该项设置为NO；如设成NO的话，即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险，建议打开。
	//置为NO，主要用于这种情况：客户端请求的是子域名，而证书上的是另外一个域名。因为SSL证书上的域名是独立的。
	//如置为NO，建议自己添加对应域名的校验逻辑。
	securityPolicy.validatesDomainName = NO;
	
	NSSet *set = [[NSSet alloc] initWithObjects:certData, nil];
	
	securityPolicy.pinnedCertificates = set;
	
	return securityPolicy;
	
}
@end
