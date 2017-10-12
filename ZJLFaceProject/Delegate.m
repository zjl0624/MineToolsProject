//
//  Delegate.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/11.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "Delegate.h"
@interface Delegate () {
	SelectedBlock _selectedBlock;
	TableviewCellHeightBlock _cellHeightBlock;
	TableviewSectionHeaderHeightBlock _tableviewSectionHeaderHeightBlock;
	TableviewSectionFooterHeightBlock _tableviewSectionFooterHeightBlock;
}

@end
@implementation Delegate

- (instancetype)initWithSelectedBlock:(SelectedBlock)selectedBlock {
	return [self initWithSelectedBlock:selectedBlock TableviewCellHeightBlock:nil TableviewSectionHeaderHeightBlock:nil TableviewSectionFooterHeightBlock:nil];
}
- (instancetype)initWithSelectedBlock:(SelectedBlock)selectedBlock
			 TableviewCellHeightBlock:(TableviewCellHeightBlock)cellHeightBlock
	TableviewSectionHeaderHeightBlock:(TableviewSectionHeaderHeightBlock)sectionHeaderHeightBlock
	TableviewSectionFooterHeightBlock:(TableviewSectionFooterHeightBlock)sectionFooterHeightBlock {
	self = [super init];
	if (self) {
		_selectedBlock = selectedBlock;
		_cellHeightBlock = cellHeightBlock;
		_tableviewSectionHeaderHeightBlock = sectionHeaderHeightBlock;
		_tableviewSectionFooterHeightBlock = sectionFooterHeightBlock;
	}
	return self;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	if (_selectedBlock) {
		_selectedBlock(indexPath);
	}

}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	if (_cellHeightBlock) {
		return _cellHeightBlock(indexPath);
	}else {
		return 44;
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
	if (_tableviewSectionHeaderHeightBlock) {
		return _tableviewSectionHeaderHeightBlock(section);
	}else {
		return 0;
	}
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
	if (_tableviewSectionFooterHeightBlock) {
		return _tableviewSectionFooterHeightBlock(section);
	}else {
		return 0;
	}
}

#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	if (_selectedBlock) {
		_selectedBlock(indexPath);
	}
}
@end
