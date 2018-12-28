//
//  LocationViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/11/7.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "LocationViewController.h"
#import "LocationArr.h"
#import "LocationModel.h"
#import "CustomLocationManager.h"

@interface LocationViewController ()

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [[CustomLocationManager sharedManager] beginLocation];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLocation) name:@"LocaitonName" object:nil];
}

- (void)updateLocation {
    NSString *filePath = [NSTemporaryDirectory() stringByAppendingString:@"archiver.txt"];
    NSMutableData *data = [NSMutableData dataWithContentsOfFile:filePath];
    NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    LocationArr *locationArr = [unArchiver decodeObjectForKey:@"LocationArr"];
    [locationArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        LocationModel *model = (LocationModel *)obj;
        NSLog(@"%@  %@",model.dateStr,model.detail);
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
