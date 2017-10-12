//
//  ButtonCollectionViewCell.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/8.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ButtonCollectionViewCell;
@protocol ButtonClickDelegate

- (void)clickButton:(ButtonCollectionViewCell *)cell sender:(UIButton *)sender;

@end
@interface ButtonCollectionViewCell : UICollectionViewCell

@property (weak,nonatomic) id<ButtonClickDelegate> delegate;

- (void)configureCell:(NSString *)title;
@end
