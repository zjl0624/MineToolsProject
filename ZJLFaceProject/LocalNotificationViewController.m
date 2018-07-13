//
//  LocalNotificationViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/2/27.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "LocalNotificationViewController.h"

@interface LocalNotificationViewController ()
- (IBAction)testBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;


@end

@implementation LocalNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Button Action
- (IBAction)testBtn:(id)sender {
	UILocalNotification *localNotification = [[UILocalNotification alloc] init];
	localNotification.alertBody = @"测试";
	localNotification.fireDate = self.datePicker.date;
	localNotification.alertAction = @"试一下";
	localNotification.applicationIconBadgeNumber = 1;
	localNotification.soundName = UILocalNotificationDefaultSoundName;
	[[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
	
}


#pragma mark - private method
- (NSString *)getCurrentTime {
	NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
	[formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
	NSDate *datenow = [NSDate date];
	NSString *currentTime = [formatter stringFromDate:datenow];
	return currentTime;
}

@end
