//
//  URLSchemesViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/13.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "URLSchemesViewController.h"

@interface URLSchemesViewController ()
- (IBAction)gotoCustomAppAction:(id)sender;

@end

@implementation URLSchemesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)gotoCustomAppAction:(id)sender {
	NSString *path = @"ClockProject://?name=zjl&phone=123123231";
	
	if ([[UIApplication sharedApplication]
		 canOpenURL:[NSURL URLWithString:path]])
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:path]];
	}
	else
	{
		NSLog(@"can not open URL scheme");
	}

}
@end
