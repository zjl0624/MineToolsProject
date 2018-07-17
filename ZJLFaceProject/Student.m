//
//  Student.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "Student.h"
#import <objc/runtime.h>

@implementation Student
int eat(id self,SEL sel,NSString *paramA,NSString *paramB){
	
	NSLog(@"eat--------%@   %@",paramA,paramB);
	return 1;
}
+ (BOOL)resolveInstanceMethod:(SEL)sel {
	if (sel == NSSelectorFromString(@"eat")) {
		class_addMethod(self, sel, (IMP)eat, "B@:@@");
		return YES;
	}else {
		return [super resolveInstanceMethod:sel];
	}
}

@end


@implementation Course

@end
