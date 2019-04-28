//
//  WaterMarkTool.h
//  ZJLFaceProject
//
//  Created by zjl on 2019/4/28.
//  Copyright © 2019年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WaterMarkTool : NSObject
+ (UIImage *)addImage:(UIImage *)useImage addMaskImage:(UIImage *)maskImage maskImageFrame:(CGRect)frame;
@end

NS_ASSUME_NONNULL_END
