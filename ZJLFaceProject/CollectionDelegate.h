//
//  CollectionDelegate.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/15.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Delegate.h"
@protocol ScrollDelegate
- (void)didScroll:(float)percent;
@end
@interface CollectionDelegate : Delegate
@property (nonatomic,weak) id<ScrollDelegate> scrollDelegate;
@end
