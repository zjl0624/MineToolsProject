//
//  SQLiteViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/15.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "SQLiteViewController.h"
#import "sqlite3.h"
@interface SQLiteViewController () {
	sqlite3_stmt *statement;
	sqlite3 *db;
	char *error;
	UIButton *createTableButton;
	UIButton *insertButton;
	UIButton *queryButton;
}

@end

@implementation SQLiteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self initUI];
	[self openDb];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}


- (void)initUI {
	self.view.backgroundColor = [UIColor whiteColor];
	createTableButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 80, 100, 40)];
	[createTableButton setTitle:@"创建表" forState:UIControlStateNormal];
	[createTableButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[createTableButton addTarget:self action:@selector(createTable) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:createTableButton];
	
	insertButton = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(createTableButton.frame) + 20, 100, 40)];
	[insertButton setTitle:@"增加一条数据" forState:UIControlStateNormal];
	[insertButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[insertButton addTarget:self action:@selector(insertSql) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:insertButton];
	
	queryButton = [[UIButton alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(insertButton.frame) + 20, 100, 40)];
	[queryButton setTitle:@"查询结果" forState:UIControlStateNormal];
	[queryButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[queryButton addTarget:self action:@selector(querySQL) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:queryButton];
}

- (void)openDb {
	NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
	NSString *documentDirectory = [paths objectAtIndex:0];
	NSString *path = [documentDirectory stringByAppendingString:@"/ZJLFaceProjectDB.sqlite"];
	if (sqlite3_open([path UTF8String], &db) == SQLITE_OK) {
		NSLog(@"开启数据库成功");
	}else {
		NSLog(@"开启数据库失败");
	}
}

- (void)createTable {
//    NSString *createSql = @"create table if not exists myTable(id integer primary key autoincrement, name text, age integer, address text)";
    NSString *createSql = @"create table if not exists region(id integer primary key, name text, parent_id integer)";
	if (sqlite3_exec(db, [createSql UTF8String], NULL, NULL, &error) == SQLITE_OK) {
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"创建表成功" preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *action = [UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
		
		}];
		[alert addAction:action];
		[self presentViewController:alert animated:YES completion:nil];
	}else {
		
	}
}

- (void)querySQL {
	NSString *sql = @"select * from region";
	if (sqlite3_prepare_v2(db, [sql UTF8String], -1, &statement, nil) ==SQLITE_OK) {
		while (sqlite3_step(statement) == SQLITE_ROW) {
			int id = sqlite3_column_int(statement, 0);
			NSString *name = [NSString stringWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
			NSLog(@"id = %d,name = %@",id,name);
		}
	}
}

- (void)insertSql {
//    NSString *sql = @"insert into myTable(name,age,address) values('哈哈','18','中国') ";
    NSString *sql = [self read];
	if (sqlite3_exec(db, [sql UTF8String], NULL, NULL, &error) == SQLITE_OK) {
		NSLog(@"插入成功");
	}else {
		NSLog(@"%s",error);
		sqlite3_free(error);
	}
}

- (NSString *)read {
    NSError *error;
    NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sql" ofType:@"txt"];
    NSString *content = [NSString stringWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:&error];
    return content;
}

@end
