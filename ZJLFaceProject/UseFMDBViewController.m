//
//  UseFMDBViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2019/4/25.
//  Copyright © 2019年 zjlzjl. All rights reserved.
//

#import "UseFMDBViewController.h"
#import "FMDB.h"
@interface UseFMDBViewController ()
- (IBAction)queryAction:(id)sender;
@property (nonatomic,strong) FMDatabase *db;
@end

@implementation UseFMDBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initDataBase];
}

- (void)initDataBase {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"china_city_db" ofType:@"db"];
    _db = [[FMDatabase alloc] initWithPath:path];
    if ([_db open]) {
        NSLog(@"打开数据库成功");
    }else {
        NSLog(@"打开数据库失败");
    }
}

- (void)queryWithCode:(NSString *)code {
    NSString *sql = [NSString stringWithFormat:@"select * from region where parent_id = '%@'",code];
    FMResultSet *result = [_db executeQuery:sql];
    while ([result next]) {
        NSString *city = [result objectForColumn:@"name"];
        NSString *code = [result objectForColumn:@"id"];
        NSLog(@"名字：%@ id:%@",city,code);
    }
}


- (IBAction)queryAction:(id)sender {
    [self queryWithCode:@"110100"];
}
@end
