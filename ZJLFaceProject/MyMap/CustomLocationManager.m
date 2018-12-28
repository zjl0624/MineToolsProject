//
//  CustomLocationManager.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/11/7.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "CustomLocationManager.h"
#import "LocationModel.h"
#import "LocationArr.h"

@interface CustomLocationManager()<CLLocationManagerDelegate>
//@property (nonatomic,strong) NSMutableArray *hike;
@property (nonatomic,assign) BOOL deferringUpdates;
@end
@implementation CustomLocationManager
+ (instancetype)sharedManager {
    static CustomLocationManager *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[CustomLocationManager alloc] init];
    });
    return instance;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.delegate = self;
        self.desiredAccuracy = kCLLocationAccuracyBest;
        self.distanceFilter = kCLErrorDeferredDistanceFiltered;
//        self.distanceFilter = 0;
    }
    return self;
}
- (void)beginLocation {
    [[CustomLocationManager sharedManager] requestAlwaysAuthorization];
    [[CustomLocationManager sharedManager] setAllowsBackgroundLocationUpdates:YES];
    [CustomLocationManager sharedManager].pausesLocationUpdatesAutomatically = NO;
    [[CustomLocationManager sharedManager] startUpdatingLocation];
}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations {
//    [self.hike addLocations:locations];

    // Defer updates until the user hikes a certain distance or a period of time has passed
    if (!self.deferringUpdates) {
        CLLocationDistance distance = 10;
        NSTimeInterval time = 5;
        [self allowDeferredLocationUpdatesUntilTraveled:distance timeout:time];
        self.deferringUpdates = YES;
    }
}

-(void)locationManager:(CLLocationManager *)manager didFinishDeferredUpdatesWithError:(NSError *)error {
    // Stop deferring updates
    self.deferringUpdates = NO;

    LocationModel *lm = [[LocationModel alloc] init];
    lm.isBackground = [UIApplication sharedApplication].applicationState;
    lm.detail = @"唤醒起来";
    NSDateFormatter *formater = [[NSDateFormatter alloc] init];
    [formater setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString * dateStr = [formater stringFromDate:[NSDate date]];
    lm.dateStr = dateStr;
    
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingString:@"archiver.txt"];
    NSMutableData *data = [NSMutableData dataWithContentsOfFile:filePath];
    NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    NSMutableArray *locationArr = [unArchiver decodeObjectForKey:@"LocationArr"];
    if (!locationArr) {
        locationArr = [[NSMutableArray alloc] init];
    }
    data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [locationArr addObject:lm];
    [archiver encodeObject:locationArr forKey:@"LocationArr"];
    [archiver finishEncoding];
    [data writeToFile:filePath options:NSDataWritingAtomic error:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LocaitonName" object:nil];
    
    // Adjust for the next goal
}



@end
