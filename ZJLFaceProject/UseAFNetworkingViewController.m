//
//  UseAFNetworkingViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/2/26.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "UseAFNetworkingViewController.h"
#import "NetManger.h"
#import "UIImageView+AFNetworking.h"
#import "AFNetworking.h"
@interface UseAFNetworkingViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation UseAFNetworkingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    http://img5.imgtn.bdimg.com/it/u=171063406,1159921561&fm=26&gp=0.jpg
//    http://img.zcool.cn/community/0117e2571b8b246ac72538120dd8a4.jpg@1280w_1l_2o_100sh.jpg
    NSString *imgUrl = @"http://img5.imgtn.bdimg.com/it/u=171063406,1159921561&fm=26&gp=0.jpg";
    [self.imageView setImageWithURL:[NSURL URLWithString:imgUrl]];
	[[NetManger sharedInstance] getWithUrl:@"xiaoligehaha?platform=uplay" param:nil success:^(id response) {
		NSLog(@"%@",response);
	}];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
