//
//  WaterMarkViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2019/4/28.
//  Copyright © 2019年 zjlzjl. All rights reserved.
//

#import "WaterMarkViewController.h"
#import "WaterMarkTool.h"

@interface WaterMarkViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *oldImageView;
@property (weak, nonatomic) IBOutlet UIImageView *markImageView;

@end

@implementation WaterMarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _markImageView.image = [WaterMarkTool addImage:_oldImageView.image addMaskImage:[UIImage imageNamed:@"29.png"] maskImageFrame:CGRectMake(_oldImageView.image.size.width/2, _oldImageView.image.size.height/2, _oldImageView.image.size.width/2, _oldImageView.image.size.height/2)];
}



@end
