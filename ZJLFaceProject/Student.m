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
	return 222;
}
- (NSInteger)flyWithA:(NSString *)a b:(NSString *)b{
	NSLog(@"fly --------%@   %@",a,b);
	return 111;
}
+ (BOOL)resolveInstanceMethod:(SEL)sel {
	if (sel == @selector(flyWithA:b:)) {
		class_addMethod(self, sel, class_getMethodImplementation([self class], @selector(flyWithA:b:)), "i@:@@");
		return YES;
	}else if (sel == @selector(eat)){
		class_addMethod(self, sel, (IMP)eat, "i@:@@");
		return YES;
	}else {
		return [super resolveInstanceMethod:sel];
	}
}

@end


@implementation Course

@end
