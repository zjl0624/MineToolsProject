//
//  SaveIndex.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SaveIndex : NSObject
+ (void)saveContentOffsetY:(CGFloat)y;

+ (CGFloat)readContentOffsetY;
@end
