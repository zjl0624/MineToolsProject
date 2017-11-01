//
//  ZJLHud.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/11/1.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,HudType){
	alertType
};
@interface ZJLHud : NSObject
+ (void)showCustomHud:(BOOL)isAutoClose type:(HudType)type title:(NSString *)title;
@end
