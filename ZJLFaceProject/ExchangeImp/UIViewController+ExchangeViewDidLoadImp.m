//
//  UIViewController+ExchangeViewDidLoadImp.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/13.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "UIViewController+ExchangeViewDidLoadImp.h"
#import <objc/runtime.h>
@implementation UIViewController (ExchangeViewDidLoadImp)

+ (void)load {
	Method oldMethod = class_getInstanceMethod([self class], @selector(viewDidLoad));
	Method newMethod = class_getInstanceMethod([self class], @selector(myViewDidLoad));
	method_exchangeImplementations(oldMethod, newMethod);
}

- (void)myViewDidLoad {
	[self myViewDidLoad];
	self.navigationItem.title = NSStringFromClass([self class]);
//	[ZJLHud showCustomHud:YES type:alertType title:@"haha"];
	NSLog(@"进入%@页面",NSStringFromClass([self class]));
}
@end
