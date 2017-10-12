//
//  MenuView.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/15.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "MenuView.h"
#import "DataSource.h"
#import "Delegate.h"
#import "MenuCollectionViewCell.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ViewHeight ([UIScreen mainScreen].bounds.size.height - 64)
#define MenuViewHeight 64
@interface MenuView() {
	NSMutableArray *dataArray;
	DataSource *dataSource;
	Delegate *delegate;
}
@property (weak, nonatomic) IBOutlet UICollectionView *collectionview;

@end
@implementation MenuView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame {
	self = [super initWithFrame:frame];
	if (self) {
		self = [[[NSBundle mainBundle] loadNibNamed:@"MenuView" owner:self options:nil] objectAtIndex:0];
		self.frame = frame;
		
		dataArray = [[NSMutableArray alloc] init];
		[dataArray addObject:@{@"title":@"进度",@"icon":@"approval_default.png"}];
		[dataArray addObject:@{@"title":@"设置",@"icon":@"application_default.png"}];
		dataSource = [[DataSource alloc] initWithDataArray:dataArray numberOfSection:1 cellIDConfigureBlock:^NSString *(NSIndexPath *indexPath, id model) {
			return @"cell";
		} cellConfigure:^(NSIndexPath *indexPath, id model, id cell) {
			
		}];
		delegate = [[Delegate alloc] initWithSelectedBlock:^(NSIndexPath *indexPath) {
			if (indexPath.row == 0) {
				[_menuItemDelegate clickItem:ProgressSlider];
				NSLog(@"点击了进度");
			}else if (indexPath.row == 1) {
				[_menuItemDelegate clickItem:Usersetting];
				NSLog(@"点击了设置");
			}
		}];
		UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
		layout.itemSize = CGSizeMake(ScreenWidth/2, MenuViewHeight);
		layout.minimumLineSpacing = 0;
		layout.minimumInteritemSpacing = 0;
		_collectionview.collectionViewLayout = layout;
		[_collectionview registerNib:[UINib nibWithNibName:@"MenuCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
		_collectionview.delegate = delegate;
		_collectionview.dataSource = dataSource;
		
	}
	return self;
}
@end
