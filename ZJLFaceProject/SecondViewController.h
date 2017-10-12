//
//  SecondViewController.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/8.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol passValueDelegate
- (void)passTextFieldValue:(NSString *)text;
@end
@interface SecondViewController : UIViewController

@property (weak,nonatomic) id<passValueDelegate> delegate;

@property (nonatomic,strong) NSString *propertyValue;

@end
