//
//  MenuCollectionViewCell.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/15.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "MenuCollectionViewCell.h"
@interface MenuCollectionViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation MenuCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (void)configureCellWithModel:(id)model {
	NSDictionary *dic = (NSDictionary *)model;
	_iconImageView.contentMode = UIViewContentModeScaleAspectFit;
	[_iconImageView setImage:[UIImage imageNamed:dic[@"icon"]]];
	_titleLabel.text = dic[@"title"];
}
@end
