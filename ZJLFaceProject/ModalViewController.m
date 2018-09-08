//
//  ModalViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/9/6.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "ModalViewController.h"

@interface ModalViewController ()
- (IBAction)quit:(id)sender;

@end

@implementation ModalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)quit:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
