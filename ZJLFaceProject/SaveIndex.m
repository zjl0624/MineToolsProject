//
//  SaveIndex.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "SaveIndex.h"

@implementation SaveIndex
+ (void)saveContentOffsetY:(CGFloat)y {
	NSUserDefaults *userDefaults = [[NSUserDefaults alloc] init];
	[userDefaults setObject:[NSNumber numberWithFloat:y] forKey:@"ContentOffsetY"];
	[userDefaults synchronize];
}

+ (CGFloat)readContentOffsetY {
	NSUserDefaults *userDefaults = [[NSUserDefaults alloc] init];
	return [userDefaults floatForKey:@"ContentOffsetY"];
}
@end
