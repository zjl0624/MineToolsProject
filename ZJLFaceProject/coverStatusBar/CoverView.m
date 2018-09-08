//
//  CoverView.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/9/8.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "CoverView.h"

@implementation CoverView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.windowLevel=UIWindowLevelAlert;
        self.backgroundColor = [UIColor whiteColor];
        [self makeKeyAndVisible];
    }
    return self;
}

- (id) init

{
    
    CGRect f=[[UIScreen mainScreen] bounds];
    
    CGRect s=[[UIApplication sharedApplication] statusBarFrame];
    
    self = [super initWithFrame:CGRectMake(0, 0, f.size.width, s.size.height)];
    
    if (self != nil) {
        
        self.windowLevel=UIWindowLevelAlert;
        
        self.backgroundColor=[UIColor clearColor];
        
        
        
        
        
        [self makeKeyAndVisible];
        
    }
    
    return self;
    
}

@end
