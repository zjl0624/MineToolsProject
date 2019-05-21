//
//  TableInTableContentTableViewCell.m
//  ZJLFaceProject
//
//  Created by zjl on 2019/5/20.
//  Copyright © 2019年 zjlzjl. All rights reserved.
//

#import "TableInTableContentTableViewCell.h"
#import "DataSource.h"

@interface TableInTableContentTableViewCell()<ConfigureCellDelegate>
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end
@implementation TableInTableContentTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCellWithModel:(id)model {
    _titleLabel.text = model;
}

- (CGFloat)cellHeight
{
    //  强制布局之前，需要先手动设置下cell的真实宽度，以便于准确计算
    CGRect rect = self.frame;
    rect.size.width = [[UIScreen mainScreen] bounds].size.width;
    self.frame = rect;
    [self layoutIfNeeded];    //  一定要强制布局下，否则拿到的高度不准确
    return CGRectGetMaxY(_titleLabel.frame) + 12;
}

@end
