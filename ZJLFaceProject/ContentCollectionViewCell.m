//
//  ContentCollectionViewCell.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/15.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "ContentCollectionViewCell.h"
#import "UserSettings.h"
#import "UILabel+ChangeLineSpaceAndWordSpace.h"

@interface ContentCollectionViewCell()
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;

@end
@implementation ContentCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

#pragma mark - ConfigureCellDelegate
- (void)configureCellWithModel:(id)model {
	NSString *content = (NSString *)model;
	_contentLabel.text = content;
	_contentLabel.font = [UIFont systemFontOfSize:[UserSettings sharedInstance].fontSize];
	[UILabel changeSpaceForLabel:_contentLabel withLineSpace:5 WordSpace:0];
}

@end
