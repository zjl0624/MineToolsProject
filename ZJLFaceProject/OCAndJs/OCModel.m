//
//  OCModel.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/13.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "OCModel.h"

@implementation OCModel

- (void)show {
	NSLog(@"调用成功");
}

- (void)showA:(NSString *)strA B:(NSString *)strB {
	NSLog(@"%@,%@",strA,strB);
	[self.delegate showABCallBack:strA b:strB];
}
@end
