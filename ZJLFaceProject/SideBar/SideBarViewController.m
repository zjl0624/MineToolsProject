//
//  SideBarViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2019/4/26.
//  Copyright © 2019年 zjlzjl. All rights reserved.
//

#import "SideBarViewController.h"
#import "SideBar.h"
#import "AppDelegate.h"
@interface SideBarViewController ()
@property (nonatomic,strong) UILabel *testLabel;
@property (nonatomic,strong) UIView *shadowView;
@property (nonatomic,strong) SideBar *sideBar;
@property (nonatomic,strong) UIPanGestureRecognizer *panGesture;
@end

@implementation SideBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    _testLabel = [[UILabel alloc] init];
    _testLabel.text= @"测试";
    _testLabel.textColor = [UIColor blackColor];
    _testLabel.frame = CGRectMake(0, 100, 100, 30);
    [self.view addSubview:_testLabel];

}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!_sideBar) {
        _sideBar = [[SideBar alloc] initWithFrame:CGRectMake(-200, 0, 200, [UIScreen mainScreen].bounds.size.height)];
        [[UIApplication sharedApplication].delegate.window addSubview:_sideBar];
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self.view addGestureRecognizer:_panGesture];
        _shadowView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
        _shadowView.backgroundColor = [UIColor blackColor];
        _shadowView.alpha = 0.4;
        _shadowView.hidden = YES;
        [[UIApplication sharedApplication].delegate.window addSubview:_shadowView];
        UIPanGestureRecognizer *panGesture1 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [_shadowView addGestureRecognizer:panGesture1];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [_sideBar removeFromSuperview];
    _sideBar = nil;
}

- (void)pan:(UIPanGestureRecognizer *)panGes {
    CGPoint p = [panGes translationInView:self.view];
    NSLog(@"%f",p.x);
    if (panGes.state == 2) {
        if (CGRectGetMinX(self.view.frame) + p.x >= 0 && CGRectGetMinX(self.view.frame) + p.x <= CGRectGetWidth(_sideBar.frame)) {
            self.view.frame = CGRectMake(CGRectGetMinX(self.view.frame) + p.x, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
            [panGes setTranslation:CGPointZero inView:self.view];
            _sideBar.frame = CGRectMake(CGRectGetMinX(_sideBar.frame) + p.x, 0, CGRectGetWidth(_sideBar.frame), CGRectGetHeight(_sideBar.frame));
            _shadowView.hidden = NO;
            _shadowView.frame = CGRectMake(CGRectGetMaxX(_sideBar.frame), 0, CGRectGetWidth(_shadowView.frame), CGRectGetHeight(_shadowView.frame));
        }

    }else if (panGes.state == 3){
        if (CGRectGetMinX(self.view.frame) + p.x > CGRectGetWidth(_sideBar.frame)/2) {
            [UIView animateWithDuration:0.25 animations:^{
                self.view.frame = CGRectMake(CGRectGetWidth(_sideBar.frame), 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
                _sideBar.frame = CGRectMake(0, 0, CGRectGetWidth(_sideBar.frame), CGRectGetHeight(_sideBar.frame));
                _shadowView.frame = CGRectMake(CGRectGetMaxX(_sideBar.frame), 0, CGRectGetWidth(_shadowView.frame), CGRectGetHeight(_shadowView.frame));
            }];
            
        }else {
            [UIView animateWithDuration:0.25 animations:^{
                self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
                _sideBar.frame = CGRectMake(-CGRectGetWidth(_sideBar.frame), 0, CGRectGetWidth(_sideBar.frame), CGRectGetHeight(_sideBar.frame));
                _shadowView.frame = CGRectMake(CGRectGetMaxX(_sideBar.frame), 0, CGRectGetWidth(_shadowView.frame), CGRectGetHeight(_shadowView.frame));
                _shadowView.hidden = YES;
            }];

        }
    }

    
}

@end
