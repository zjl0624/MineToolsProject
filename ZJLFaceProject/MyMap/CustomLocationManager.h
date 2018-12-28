//
//  CustomLocationManager.h
//  ZJLFaceProject
//
//  Created by zjl on 2018/11/7.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
NS_ASSUME_NONNULL_BEGIN

@interface CustomLocationManager : CLLocationManager
+ (instancetype)sharedManager;
- (void)beginLocation;
@end

NS_ASSUME_NONNULL_END
