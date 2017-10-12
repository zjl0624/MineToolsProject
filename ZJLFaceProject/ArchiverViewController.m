//
//  ArchiverViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/15.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "ArchiverViewController.h"
#import "CustomModel.h"

@interface ArchiverViewController () {
	CustomModel *model;
	NSString *filePath;
	UIButton *archiverButton;
	UIButton *unArchiverButton;
}

@end

@implementation ArchiverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	model = [[CustomModel alloc] initWithParamA:@"参数A" ParamB:5];
	filePath = [NSTemporaryDirectory() stringByAppendingString:@"archiver.txt"];
	
	
	archiverButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 80, 100, 40)];
	[archiverButton setTitle:@"序列化" forState:UIControlStateNormal];
	[archiverButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[archiverButton addTarget:self action:@selector(Archiver) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:archiverButton];
	
	unArchiverButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 100, 40)];
	[unArchiverButton setTitle:@"反序列化" forState:UIControlStateNormal];
	[unArchiverButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
	[unArchiverButton addTarget:self action:@selector(unArchiver) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:unArchiverButton];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)Archiver {
	NSMutableData *data = [[NSMutableData alloc] init];
	NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
	[archiver encodeObject:model forKey:@"CustomModel"];
	[archiver finishEncoding];
	[data writeToFile:filePath options:NSDataWritingAtomic error:nil];
}

- (void)unArchiver {
	NSMutableData *data = [NSMutableData dataWithContentsOfFile:filePath];
	NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
	CustomModel *readModel = [unArchiver decodeObjectForKey:@"CustomModel"];
	NSLog(@"paramA = %@,paramB = %ld",readModel.paramA,readModel.paramB);
}

@end
