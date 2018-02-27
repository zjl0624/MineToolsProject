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
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)testBtn:(id)sender {
	UILocalNotification *localNotification = [[UILocalNotification alloc] init];
	localNotification.alertBody = @"测试";
	localNotification.fireDate = self.datePicker.date;
	localNotification.alertAction = @"试一下";
	localNotification.applicationIconBadgeNumber = 1;
	localNotification.soundName = UILocalNotificationDefaultSoundName;
	[[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
	
}
@end
