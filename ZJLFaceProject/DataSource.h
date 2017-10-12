//
//  DataSource.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/9.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@protocol ConfigureCellDelegate
- (void)configureCellWithModel:(id)model;
@end

@interface DataSource : NSObject<UITableViewDataSource,UICollectionViewDataSource>
//数据源数组
@property (nonatomic,strong) NSArray *dataArray;
//section的数量
@property (nonatomic,assign) NSInteger numberOfSection;
//配置cellIdentifer的block
typedef NSString *(^CellIDConfigureBlock)(NSIndexPath *indexPath,id model);
//cell个性化配置的block
typedef void(^CellConfigureBlock)(NSIndexPath *indexPath,id model,id cell);
//配置collection header和footer的id
typedef NSDictionary *(^ReusableViewIDConfigureBlock)(NSIndexPath *indexPath);
//配置collectionview的header和footerview
typedef NSDictionary *(^ReusableViewConfigureBlock)(NSIndexPath *indexPath);

- (instancetype)initWithDataArray:(NSArray *)dataArray
			 cellIDConfigureBlock:(CellIDConfigureBlock)cellIDConfigureBlock
					cellConfigure:(CellConfigureBlock)cellConfigureBlock;

- (instancetype)initWithDataArray:(NSArray *)dataArray
				  numberOfSection:(NSInteger)numberOfSection
			 cellIDConfigureBlock:(CellIDConfigureBlock)cellIDConfigureBlock
					cellConfigure:(CellConfigureBlock)cellConfigureBlock;

- (instancetype)initWithDataArray:(NSArray *)dataArray
				  numberOfSection:(NSInteger)numberOfSection
			 cellIDConfigureBlock:(CellIDConfigureBlock)cellIDConfigureBlock
					cellConfigure:(CellConfigureBlock)cellConfigureBlock
	 ReusableViewIDConfigureBlock:(ReusableViewIDConfigureBlock)reusableViewIDConfigureBlock
	   ReusableViewConfigureBlock:(ReusableViewConfigureBlock)reusableViewConfigureBlock;
@end
