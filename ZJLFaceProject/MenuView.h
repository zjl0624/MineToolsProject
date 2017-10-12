//
//  MenuView.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/15.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger,MenuItemType){
	ProgressSlider,
	Usersetting
};
@protocol MenuClickItemDelegate
- (void)clickItem:(MenuItemType)type;
@end
@interface MenuView : UIView

@property (weak,nonatomic) id<MenuClickItemDelegate> menuItemDelegate;

- (instancetype)initWithFrame:(CGRect)frame;
@end
