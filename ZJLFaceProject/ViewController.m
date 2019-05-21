//
//  ViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/13.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "ViewController.h"
#import "JsonToModelViewController.h"
#import "KVCViewController.h"
#import "KVOViewController.h"
#import "TimerViewController.h"
#import "GCDMainViewController.h"
#import "SaveDataMainViewController.h"
#import "PassValueViewController.h"
#import "TableViewController.h"
#import "AnimationViewController.h"
#import "ReaderViewController.h"
#import "TestScrollerViewController.h"
#import "StringViewController.h"
#import "ShowHudViewController.h"
#import "DragViewController.h"
#import "SortViewController.h"
#import "CicleImageViewController.h"
#import "UseAFNetworkingViewController.h"
#import "LocalNotificationViewController.h"
#import "MagicCoinViewController.h"
#import "AvPlayerViewController.h"
#import "HorizontalscreenViewController.h"
#import "TestJSPatchViewController.h"
#import "RecordingVideoViewController.h"
#import "CopyViewController.h"
#import "FBViewController.h"
#import "CALyerViewController.h"
#import "JSOCViewController.h"
#import "URLSchemesViewController.h"
//#import "MapViewController.h"
#import "XMLViewController.h"
#import "ClickRangeViewController.h"
#import "BGViewController.h"
#import "ModalViewController.h"
#import "CoverStatusBarViewController.h"
#import "IphonexViewController.h"
#import "PhotoViewController.h"
//#import "LocationViewController.h"
#import "SideBarViewController.h"
#import "WaterMarkViewController.h"
#import "TableInTableViewController.h"

static NSString * const cellIdentifier = @"cell";
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource> {
	UITableView *tableview;
	NSMutableArray *dataArray;

}

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.navigationItem.title = @"我的知识点";
    void (^block)(void);
	BOOL x = YES;
	if(x)
	{
		block = ^{ printf("x\n"); };
	}
	else
	{
		block = ^{ printf("not x\n"); };
	}
	block();
	[self initTableview];
}


- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [dataArray count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:cellIdentifier];
	if (!cell) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
	}
	cell.textLabel.text = dataArray[indexPath.row];
	return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	UIViewController *vc;
	switch (indexPath.row) {
		case 0:
			vc = [[JsonToModelViewController alloc] init];
			break;
		case 1:
			vc = [[KVCViewController alloc] init];
			break;
		case 2:
			vc = [[KVOViewController alloc] init];
			break;
		case 3:
			vc = [[TimerViewController alloc] init];
			break;
		case 4:
			vc= [[GCDMainViewController alloc] init];
			break;
		case 5:
			vc = [[SaveDataMainViewController alloc] init];
			break;
		case 6:
			vc = [[PassValueViewController alloc] init];
			break;
		case 7:
			vc = [[TableViewController alloc] init];
			break;
		case 8:
			vc = [[AnimationViewController alloc] initWithNibName:@"AnimationViewController"bundle:nil];
			break;
		case 9:
			vc = [[ReaderViewController alloc] init];
			break;
		case 10:
			vc = [[TestScrollerViewController alloc] init];
			break;
		case 11:
			vc = [[StringViewController alloc] init];
			break;
		case 12:
			vc = [[ShowHudViewController alloc] init];
			break;
		case 13:
			vc = [[DragViewController alloc] init];
			break;
		case 14:
			vc = [[SortViewController alloc] init];
			break;
		case 15:
			vc = [[CicleImageViewController alloc] initWithNibName:@"CicleImageViewController" bundle:nil];
			break;
		case 16:
			vc = [[UseAFNetworkingViewController alloc] initWithNibName:@"UseAFNetworkingViewController" bundle:nil];
			break;
		case 17:
			vc = [[LocalNotificationViewController alloc] initWithNibName:@"LocalNotificationViewController" bundle:nil];
			break;
		case 18:
			vc = [[MagicCoinViewController alloc] init];
			break;
		case 19:
			vc = [[AvPlayerViewController alloc] initWithNibName:@"AvPlayerViewController" bundle:nil];
			break;
		case 20:
			vc = [[HorizontalscreenViewController alloc] initWithNibName:@"HorizontalscreenViewController" bundle:nil];
			break;
		case 21:
			vc = [[TestJSPatchViewController alloc] init];
			break;
		case 22:
			vc = [[RecordingVideoViewController alloc] initWithNibName:@"RecordingVideoViewController" bundle:nil];
			break;
		case 23:
			vc = [[CopyViewController alloc] init];
			break;
		case 24:
			vc = [[FBViewController alloc] initWithNibName:@"FBViewController" bundle:nil];
			break;
		case 25:
			vc = [[CALyerViewController alloc] init];
			break;
		case 26:
			vc = [[JSOCViewController alloc] initWithNibName:@"JSOCViewController" bundle:nil];
			break;
		case 27:
			vc = [[URLSchemesViewController alloc] initWithNibName:@"URLSchemesViewController" bundle:nil];
			break;
//        case 28:
//            vc = [[MapViewController alloc] init];
//            break;
		case 29:
			vc = [[XMLViewController alloc] initWithNibName:@"XMLViewController" bundle:nil];
			break;
		case 30:
			vc = [[ClickRangeViewController alloc] initWithNibName:@"ClickRangeViewController" bundle:nil];
			break;
        case 31:
            vc = [[BGViewController alloc] init];
            break;
        case 32:{
            vc = [[ModalViewController alloc] initWithNibName:@"ModalViewController" bundle:nil];
            MyNaviVController *navi = [[MyNaviVController alloc] initWithRootViewController:vc];
            [self presentViewController:navi animated:YES completion:nil];
            return;
        }
        case 33:
            vc = [[CoverStatusBarViewController alloc] initWithNibName:@"CoverStatusBarViewController" bundle:nil];
            break;
        case 34:
            vc = [[IphonexViewController alloc] initWithNibName:@"IphonexViewController" bundle:nil];
            break;
        case 35:
            vc = [[PhotoViewController alloc] initWithNibName:@"PhotoViewController" bundle:nil];
            break;
//        case 36:
//            vc = [[LocationViewController alloc] init];
//            break;
        case 37:
            vc = [[SideBarViewController alloc] init];
            break;
        case 38:
            vc = [[WaterMarkViewController alloc] init];
            break;
        case 39:
            vc = [[TableInTableViewController alloc] init];
            break;
	}
	[self.navigationController pushViewController:vc animated:YES];
}

#pragma mark - Init UI
- (void)initTableview {
	tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
	[self.view addSubview:tableview];
	tableview.delegate = self;
	tableview.dataSource = self;
	dataArray = [[NSMutableArray alloc] init];
	[dataArray addObject:@"json转对象"];
	[dataArray addObject:@"KVC"];
	[dataArray addObject:@"KVO"];
	[dataArray addObject:@"Timer"];
	[dataArray addObject:@"GCD"];
	[dataArray addObject:@"各种数据存储方式"];
	[dataArray addObject:@"三种页面间传值方式"];
	[dataArray addObject:@"分离datasource"];
	[dataArray addObject:@"动画"];
	[dataArray addObject:@"阅读器"];
	[dataArray addObject:@"测试scroller的滚动"];
	[dataArray addObject:@"字符串操作"];
	[dataArray addObject:@"显示提示框"];
	[dataArray addObject:@"拖拽移动"];
	[dataArray addObject:@"各种排序方法"];
	[dataArray addObject:@"图片圆角处理"];
	[dataArray addObject:@"封装AFNetworking"];
	[dataArray addObject:@"设置本地推送"];
	[dataArray addObject:@"牛客网编程题"];
	[dataArray addObject:@"AVPlayer"];
	[dataArray addObject:@"强制横屏"];
	[dataArray addObject:@"JSPatch"];
	[dataArray addObject:@"录制视频"];
	[dataArray addObject:@"Copy"];
	[dataArray addObject:@"frame和bounds"];
	[dataArray addObject:@"CAlayer动画"];
	[dataArray addObject:@"jsOC互相调用"];
	[dataArray addObject:@"URLSchemes用法"];
	[dataArray addObject:@"地图"];
	[dataArray addObject:@"解析xml"];
	[dataArray addObject:@"扩大按钮点击范围"];
    [dataArray addObject:@"半透明遮罩"];
    [dataArray addObject:@"横屏问题"];
    [dataArray addObject:@"覆盖状态栏"];
    [dataArray addObject:@"xib适配iphoneX"];
    [dataArray addObject:@"系统相机"];
    [dataArray addObject:@"后台定位"];
    [dataArray addObject:@"侧边栏"];
    [dataArray addObject:@"图片加水印"];
    [dataArray addObject:@"tableview里面套tableview"];
}

@end
