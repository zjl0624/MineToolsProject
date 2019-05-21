//
//  TableInTableViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2019/5/20.
//  Copyright © 2019年 zjlzjl. All rights reserved.
//

#import "TableInTableViewController.h"
#import "DataSource.h"
#import "Delegate.h"

@interface TableInTableViewController ()
@property (nonatomic,strong) UITableView *tableView;
@property (nonatomic,strong) DataSource *dataSource;
@end

@implementation TableInTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *dataArray = @[@"打发大水发顺丰的撒发放的法师法师法发顺丰的阿萨德法师发大水发顺丰,dfadaf打发,没你好几年覅你玩吧虐我帮你服务不复发不完二环内覅偶窝囊废我服你毕方复发不完二环内覅偶窝囊废我服你毕方复发不完二环内覅偶窝囊废我服你毕方复发不完二环内覅偶窝囊废我服你毕方复发不完二环内覅偶窝囊废我服你毕方复发不完二环内覅偶窝囊废我服你毕方复发不完二环内覅偶窝囊废我服你毕方复发不完二环内覅偶窝囊废我服你毕方"];
    _dataSource = [[DataSource alloc] initWithDataArray:dataArray numberOfSection:1 cellIDConfigureBlock:^NSString *(NSIndexPath *indexPath, id model) {
        return @"cell";
    } cellConfigure:^(NSIndexPath *indexPath, id model, id cell) {
        
    }];
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 88)];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
    _tableView.dataSource = _dataSource;
    _tableView.estimatedRowHeight = 44;
    [_tableView registerNib:[UINib nibWithNibName:@"TableInTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_tableView reloadData];
    });
}


@end
