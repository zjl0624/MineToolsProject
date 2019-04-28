//
//  WaterMarkTool.m
//  ZJLFaceProject
//
//  Created by zjl on 2019/4/28.
//  Copyright © 2019年 zjlzjl. All rights reserved.
//

#import "WaterMarkTool.h"

@implementation WaterMarkTool
+ (UIImage *)addImage:(UIImage *)useImage addMaskImage:(UIImage *)maskImage maskImageFrame:(CGRect)frame
{
    
#if __IPHONE_OS_VERSION_MAX_ALLOWED >= 40000
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 4.0)
    {
        UIGraphicsBeginImageContextWithOptions(useImage.size ,NO, 0.0); // 0.0 for scale means "scale for device's main screen".
    }
#else
    if ([[[UIDevice currentDevice] systemVersion] floatValue] < 4.0)
    {
        UIGraphicsBeginImageContext(useImage.size);
    }
#endif
    [useImage drawInRect:CGRectMake(0, 0, useImage.size.width, useImage.size.height)];
    
    //四个参数为水印图片的位置
//    [maskImage drawInRect:CGRectMake(0, 0, useImage.size.width, useImage.size.height/2)];
    [maskImage drawInRect:frame];
    UIImage *resultingImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return resultingImage;
}
@end
