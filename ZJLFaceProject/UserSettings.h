//
//  UserSettings.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,BgColor){
	white,
	blue
};
@interface UserSettings : NSObject<NSCoding>
//字体大小
@property (nonatomic,assign) float fontSize;
//背景颜色
@property (nonatomic,assign) BgColor bgColor;
//是否是分页的方式
@property (nonatomic,assign) BOOL isPage;
//存放每本书籍看到的位置
//@property (nonatomic,strong) NSDictionary *indexDict;
@property (nonatomic,assign) float index;

//整本书的长度
@property (nonatomic,assign) float allContentLength;
+ (instancetype)sharedInstance;

+ (void)Archiver;

+ (void)unArchiver;
@end
