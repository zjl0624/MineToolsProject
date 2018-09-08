//
//  CoverStatusBarViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/9/8.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "CoverStatusBarViewController.h"
#import "CoverView.h"
@interface CoverStatusBarViewController ()
- (IBAction)back:(id)sender;
@property (nonatomic,strong) CoverView *coverView;
@end

@implementation CoverStatusBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _coverView = [[CoverView alloc] init];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 200, 100)];
    view.backgroundColor = [UIColor redColor];
    [_coverView addSubview:view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = YES;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)back:(id)sender {
    _coverView = nil;
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)dealloc {
    
}
@end
