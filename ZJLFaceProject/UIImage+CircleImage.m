//
//  UIImage+CircleImage.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/2/26.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "UIImage+CircleImage.h"

@implementation UIImage (CircleImage)
+ (instancetype)CircleImageWithImage:(UIImage *)image {
	UIGraphicsBeginImageContext(image.size);
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
	CGContextAddEllipseInRect(ctx, rect);
	CGContextClip(ctx);
	[image drawInRect:rect];
	UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	return resultImage;
	
}
@end
