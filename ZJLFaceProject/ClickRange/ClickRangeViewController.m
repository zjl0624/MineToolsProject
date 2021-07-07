//
//  ClickRangeViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/24.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "ClickRangeViewController.h"
#import "UIButton+Enlarge.h"

@interface ClickRangeViewController ()
- (IBAction)buttonAction:(id)sender;

@property (weak, nonatomic) IBOutlet UIButton *testButton;
- (IBAction)clickButton:(id)sender;

@end

@implementation ClickRangeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self.testButton setTouchRangeWithTop:100 left:15 bottom:45 right:15];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)clickButton:(id)sender {
	UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"点击了按钮" preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleCancel handler:nil];
	[alertView addAction:closeAction];
	[self presentViewController:alertView animated:YES completion:nil];
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[self dismissViewControllerAnimated:alertView completion:nil];
	});
}
- (IBAction)buttonAction:(id)sender {
	UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"提示" message:@"不影响其他按钮" preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *closeAction = [UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleCancel handler:nil];
	[alertView addAction:closeAction];
	[self presentViewController:alertView animated:YES completion:nil];
	dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
		[self dismissViewControllerAnimated:alertView completion:nil];
	});
}
@end
