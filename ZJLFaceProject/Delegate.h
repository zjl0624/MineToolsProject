//
//  Delegate.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/11.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface Delegate : NSObject<UICollectionViewDelegate,UITableViewDelegate>
//tableview点击事件的block
typedef void(^SelectedBlock)(NSIndexPath *indexPath);
//返回tableviewcell高度的block
typedef CGFloat(^TableviewCellHeightBlock)(NSIndexPath *indexPath);
//tableviewsectionheader的高度
typedef CGFloat(^TableviewSectionHeaderHeightBlock)(NSInteger section);
//tableviewsectionfooter的高度
typedef CGFloat(^TableviewSectionFooterHeightBlock)(NSInteger section);

- (instancetype)initWithSelectedBlock:(SelectedBlock)selectedBlock;

- (instancetype)initWithSelectedBlock:(SelectedBlock)selectedBlock
			 TableviewCellHeightBlock:(TableviewCellHeightBlock)cellHeightBlock
	TableviewSectionHeaderHeightBlock:(TableviewSectionHeaderHeightBlock)sectionHeaderHeightBlock
	TableviewSectionFooterHeightBlock:(TableviewSectionFooterHeightBlock)sectionFooterHeightBlock;
@end
