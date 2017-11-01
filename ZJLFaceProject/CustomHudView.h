//
//  CustomHudView.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/11/1.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomHudView : UIView
+ (instancetype)sharedInstance;

- (void)configureViewWithTitle:(NSString *)title;
@end
