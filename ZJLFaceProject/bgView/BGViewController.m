//
//  BGViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/8/8.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "BGViewController.h"

@interface BGViewController ()

@end

@implementation BGViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width , [UIScreen mainScreen].bounds.size.height)];
    label.textColor = [UIColor blackColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"测试一哈";
    [self.view addSubview:label];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *toolbar = [[UIView alloc] initWithFrame:CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width - 50 , [UIScreen mainScreen].bounds.size.height - 200)];
    toolbar.backgroundColor = [UIColor blackColor];
    //样式
//    toolbar.barStyle = UIBarStyleBlackTranslucent;//半透明
    //透明度
    toolbar.alpha = 0.3f;
    [self.view addSubview:toolbar];
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

@end
