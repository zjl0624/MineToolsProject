//
//  Student+AddProperty.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/13.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "Student+AddProperty.h"
char genderKey;
@implementation Student (AddProperty)


- (NSNumber *)gender {
	return objc_getAssociatedObject(self, &genderKey);
}

- (void)setGender:(NSNumber *)gender {
	objc_setAssociatedObject(self, &genderKey, gender, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
@end
