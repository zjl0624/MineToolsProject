//
//  CollectionDelegate.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/15.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "CollectionDelegate.h"
#import "UserSettings.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ViewHeight ([UIScreen mainScreen].bounds.size.height - 64)
@implementation CollectionDelegate
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
	return CGSizeMake(ScreenWidth, ScreenHeight);
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	CGFloat y = scrollView.contentOffset.y;
	//	[SaveIndex saveContentOffsetY:y];
	[UserSettings sharedInstance].index = y;
	dispatch_async(dispatch_get_main_queue(), ^{
		[UserSettings Archiver];
	});
	[self.scrollDelegate didScroll:y/scrollView.contentSize.height * 100];

}
@end
