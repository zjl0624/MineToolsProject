//
//  CicleImageViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/2/26.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "CicleImageViewController.h"
#import "UIImage+CircleImage.h"
#import "UIView+CircleView.h"

@interface CicleImageViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageview;

@end

@implementation CicleImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = [UIColor lightGrayColor];
	UIImage *image = [UIImage imageNamed:@"2.jpg"];
    self.imageview.image = image;
    [self.imageview circleView:UIRectCornerTopLeft|UIRectCornerTopRight cornerRadii:CGSizeMake(4, 4)];
//    [self.imageview setImage:[UIImage CircleImageWithImage:image]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
