//
//  TableInTableViewCell.m
//  ZJLFaceProject
//
//  Created by zjl on 2019/5/20.
//  Copyright © 2019年 zjlzjl. All rights reserved.
//

#import "TableInTableViewCell.h"
#import "DataSource.h"
#import "TableInTableContentTableViewCell.h"

@interface TableInTableViewCell()<ConfigureCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) DataSource *dataSource;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tableViewHeightConstraint;

@end
@implementation TableInTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [_tableView registerNib:[UINib nibWithNibName:@"TableInTableContentTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    _dataSource = [[DataSource alloc] initWithDataArray:@[] numberOfSection:1 cellIDConfigureBlock:^NSString *(NSIndexPath *indexPath, id model) {
        return @"cell";
    } cellConfigure:^(NSIndexPath *indexPath, id model, id cell) {
        
    }];
    _tableView.dataSource = _dataSource;
    _tableView.estimatedRowHeight = 44;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)configureCellWithModel:(id)model {
    _dataSource.dataArray = [model componentsSeparatedByString:@","];
    [_tableView reloadData];
    __block CGFloat tableViewHeight = 0;
    [_dataSource.dataArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
        TableInTableContentTableViewCell *cell = [_tableView cellForRowAtIndexPath:indexPath];
        tableViewHeight = tableViewHeight + cell.cellHeight;
    }];
    _tableViewHeightConstraint.constant = tableViewHeight;
//    [_tableView layoutIfNeeded];
}

@end
