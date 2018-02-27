//
//  LocalNotification.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/2/27.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "LocalNotification.h"

@implementation LocalNotification
+ (void)registerLocalNotification {
	UIUserNotificationSettings *settings = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
	[[UIApplication sharedApplication] registerUserNotificationSettings:settings];
}
@end
