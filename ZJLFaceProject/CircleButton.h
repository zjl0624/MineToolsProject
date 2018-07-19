//
//  CircleButton.h
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/19.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DragButtonDelegate
- (void)moves:(CGPoint)point;
@end
@interface CircleButton : UIButton
@property (nonatomic,weak) id<DragButtonDelegate> delegate;

- (instancetype)initWithFrame:(CGRect)frame;
@end
