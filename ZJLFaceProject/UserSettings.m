//
//  UserSettings.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "UserSettings.h"
static id _instance;
@implementation UserSettings
- (void)encodeWithCoder:(NSCoder *)aCoder {
	[aCoder encodeInteger:_bgColor forKey:@"backgroundColor"];
	[aCoder encodeInteger:_fontSize forKey:@"fontSize"];
	[aCoder encodeFloat:_index forKey:@"index"];
	[aCoder encodeBool:_isPage forKey:@"isPage"];
	[aCoder encodeFloat:_allContentLength forKey:@"allContentLength"];
}


- (nullable instancetype)initWithCoder:(NSCoder *)aDecoder {
	if ([self init]) {
		_index = [aDecoder decodeFloatForKey:@"index"];
		_fontSize = [aDecoder decodeIntegerForKey:@"fontSize"];
		_bgColor = [aDecoder decodeIntegerForKey:@"backgroundColor"];
		_isPage = [aDecoder decodeBoolForKey:@"isPage"];
		_allContentLength = [aDecoder decodeFloatForKey:@"allContentLength"];
	}
	return self;
}

+ (instancetype)sharedInstance
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_instance = [[self alloc] init];
	});
	return _instance;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{   //onceToken是GCD用来记录是否执行过 ，如果已经执行过就不再执行(保证执行一次）
		_instance = [super allocWithZone:zone];
	});
	return _instance;
}

- (id)copyWithZone:(NSZone *)zone
{
	return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
	return _instance;
}
+ (void)Archiver {
	NSString *filePath = [NSTemporaryDirectory() stringByAppendingString:@"archiver.txt"];
	NSMutableData *data = [[NSMutableData alloc] init];
	NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
	[archiver encodeObject:[UserSettings sharedInstance] forKey:@"UserSettings"];
	[archiver finishEncoding];
	[data writeToFile:filePath options:NSDataWritingAtomic error:nil];
}

+ (void)unArchiver {
	NSString *filePath = [NSTemporaryDirectory() stringByAppendingString:@"archiver.txt"];
	NSMutableData *data = [NSMutableData dataWithContentsOfFile:filePath];
	NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
	UserSettings *userSettings = [unArchiver decodeObjectForKey:@"UserSettings"];
	[UserSettings sharedInstance].index = userSettings.index;
	[UserSettings sharedInstance].bgColor = userSettings.bgColor;
	[UserSettings sharedInstance].fontSize = userSettings.fontSize;
	if (userSettings.fontSize == 0) {
		[UserSettings sharedInstance].fontSize = 15;
	}
	[UserSettings sharedInstance].isPage = userSettings.isPage;
	[UserSettings sharedInstance].allContentLength = userSettings.allContentLength;
}

+ (void)removeFile {
    NSFileManager *defaultManager = [NSFileManager defaultManager];
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingString:@"archiver.txt"];
    if ([defaultManager isDeletableFileAtPath:filePath]) {
        [defaultManager removeItemAtPath:filePath error:nil];
    }
}
@end
