//
//  SideBarViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2019/4/26.
//  Copyright © 2019年 zjlzjl. All rights reserved.
//

#import "SideBarViewController.h"
#import "SideBar.h"

@interface SideBarViewController ()
@property (nonatomic,strong) SideBar *sideBar;
@property (nonatomic,strong) UIPanGestureRecognizer *panGesture;
@end

@implementation SideBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    self.view.backgroundColor = [UIColor whiteColor];

}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    if (!_sideBar) {
        _sideBar = [[SideBar alloc] initWithFrame:CGRectMake(-200, 0, 200, [UIScreen mainScreen].bounds.size.height)];
        [self.view addSubview:_sideBar];
        _panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self.view addGestureRecognizer:_panGesture];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [_sideBar removeFromSuperview];
    _sideBar = nil;
}

- (void)pan:(UIPanGestureRecognizer *)panGes {
    CGPoint p = [_panGesture translationInView:self.view];
    NSLog(@"%f",p.x);
    if (panGes.state == 2) {
        if (CGRectGetMinX(self.view.frame) + p.x >= 0 && CGRectGetMinX(self.view.frame) + p.x <= CGRectGetWidth(_sideBar.frame)) {
            self.view.frame = CGRectMake(CGRectGetMinX(self.view.frame) + p.x, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
            [panGes setTranslation:CGPointZero inView:self.view];
        }

    }else if (panGes.state == 3){
        if (CGRectGetMinX(self.view.frame) + p.x > CGRectGetWidth(_sideBar.frame)/2) {
            [UIView animateWithDuration:0.25 animations:^{
                self.view.frame = CGRectMake(CGRectGetWidth(_sideBar.frame), 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame));
            }];
            
        }else {
            [UIView animateWithDuration:0.25 animations:^{
                self.view.frame = CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height);
            }];

        }
    }

    
}

@end
