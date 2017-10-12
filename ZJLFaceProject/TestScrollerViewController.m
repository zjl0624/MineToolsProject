//
//  TestScrollerViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "TestScrollerViewController.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ViewHeight ([UIScreen mainScreen].bounds.size.height - 64)
@interface TestScrollerViewController () {
	UIScrollView *scrollview;
	UILabel *contentLabel;
	UITextField *textField;
}

@end

@implementation TestScrollerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self initUI];
	[self createNavi];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	if (!textField) {
		textField = [[UITextField alloc] initWithFrame:CGRectMake(ScreenWidth/2 - 50, 5, 100, 30)];
		textField.backgroundColor = [UIColor whiteColor];
		textField.keyboardType = UIKeyboardTypeASCIICapableNumberPad;
		[self.navigationController.navigationBar addSubview:textField];
		NSString *placeholder = [NSString stringWithFormat:@"%.02f",scrollview.contentSize.height];
		textField.placeholder = placeholder;
	}else {
		textField.hidden = NO;
	}
}

- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
	textField.hidden = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - private method
- (void)initUI {
	self.automaticallyAdjustsScrollViewInsets = NO;
	scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ViewHeight)];
	NSString *content = @"支持糯米没开挂的，贴出你steam上绝地求生的游戏时间。语言反对并不贴游戏时间的，一律认为洗地。黑糯米开挂的，也贴出你的游戏时间，语言反对并没有什么用处。今天看到洗地神贴才知道，原来N多人看糯米直播的原因就是因为没买游戏。AK全自动扫车那个图，没玩过游戏的人肯定以为很正常，想给糯米洗地，很简单，贴出你的steam游戏时间。骑墙派这次可以分辨的很清楚。敢于给糯米洗地的，要么是没有游戏的小白，要么就是拿钱的。我不相信任何一个玩这个超过100小时的人会坚定的支持糯米没开挂。我是坚定的糯米开挂者，我先贴为敬。支持糯米没开挂的，贴出你steam上绝地求生的游戏时间。语言反对并不贴游戏时间的，一律认为洗地。黑糯米开挂的，也贴出你的游戏时间，语言反对并没有什么用处。今天看到洗地神贴才知道，原来N多人看糯米直播的原因就是因为没买游戏。AK全自动扫车那个图，没玩过游戏的人肯定以为很正常，想给糯米洗地，很简单，贴出你的steam游戏时间。骑墙派这次可以分辨的很清楚。敢于给糯米洗地的，要么是没有游戏的小白，要么就是拿钱的。我不相信任何一个玩这个超过100小时的人会坚定的支持糯米没开挂。我是坚定的糯米开挂者，我先贴为敬。支持糯米没开挂的，贴出你steam上绝地求生的游戏时间。语言反对并不贴游戏时间的，一律认为洗地。黑糯米开挂的，也贴出你的游戏时间，语言反对并没有什么用处。今天看到洗地神贴才知道，原来N多人看糯米直播的原因就是因为没买游戏。AK全自动扫车那个图，没玩过游戏的人肯定以为很正常，想给糯米洗地，很简单，贴出你的steam游戏时间。骑墙派这次可以分辨的很清楚。敢于给糯米洗地的，要么是没有游戏的小白，要么就是拿钱的。我不相信任何一个玩这个超过100小时的人会坚定的支持糯米没开挂。我是坚定的糯米开挂者，我先贴为敬。支持糯米没开挂的，贴出你steam上绝地求生的游戏时间。语言反对并不贴游戏时间的，一律认为洗地。黑糯米开挂的，也贴出你的游戏时间，语言反对并没有什么用处。今天看到洗地神贴才知道，原来N多人看糯米直播的原因就是因为没买游戏。AK全自动扫车那个图，没玩过游戏的人肯定以为很正常，想给糯米洗地，很简单，贴出你的steam游戏时间。骑墙派这次可以分辨的很清楚。敢于给糯米洗地的，要么是没有游戏的小白，要么就是拿钱的。我不相信任何一个玩这个超过100小时的人会坚定的支持糯米没开挂。我是坚定的糯米开挂者，我先贴为敬。支持糯米没开挂的，贴出你steam上绝地求生的游戏时间。语言反对并不贴游戏时间的，一律认为洗地。黑糯米开挂的，也贴出你的游戏时间，语言反对并没有什么用处。今天看到洗地神贴才知道，原来N多人看糯米直播的原因就是因为没买游戏。AK全自动扫车那个图，没玩过游戏的人肯定以为很正常，想给糯米洗地，很简单，贴出你的steam游戏时间。骑墙派这次可以分辨的很清楚。敢于给糯米洗地的，要么是没有游戏的小白，要么就是拿钱的。我不相信任何一个玩这个超过100小时的人会坚定的支持糯米没开挂。我是坚定的糯米开挂者，我先贴为敬。支持糯米没开挂的，贴出你steam上绝地求生的游戏时间。语言反对并不贴游戏时间的，一律认为洗地。黑糯米开挂的，也贴出你的游戏时间，语言反对并没有什么用处。今天看到洗地神贴才知道，原来N多人看糯米直播的原因就是因为没买游戏。AK全自动扫车那个图，没玩过游戏的人肯定以为很正常，想给糯米洗地，很简单，贴出你的steam游戏时间。骑墙派这次可以分辨的很清楚。敢于给糯米洗地的，要么是没有游戏的小白，要么就是拿钱的。我不相信任何一个玩这个超过100小时的人会坚定的支持糯米没开挂。我是坚定的糯米开挂者，我先贴为敬。支持糯米没开挂的，贴出你steam上绝地求生的游戏时间。语言反对并不贴游戏时间的，一律认为洗地。黑糯米开挂的，也贴出你的游戏时间，语言反对并没有什么用处。今天看到洗地神贴才知道，原来N多人看糯米直播的原因就是因为没买游戏。AK全自动扫车那个图，没玩过游戏的人肯定以为很正常，想给糯米洗地，很简单，贴出你的steam游戏时间。骑墙派这次可以分辨的很清楚。敢于给糯米洗地的，要么是没有游戏的小白，要么就是拿钱的。我不相信任何一个玩这个超过100小时的人会坚定的支持糯米没开挂。我是坚定的糯米开挂者，我先贴为敬。";
	CGSize contentSize = [content boundingRectWithSize:CGSizeMake(ScreenWidth, 1000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:25]} context:nil].size;
	contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(scrollview.frame), contentSize.height)];
	contentLabel.textAlignment = NSTextAlignmentCenter;
	contentLabel.font = [UIFont systemFontOfSize:25];
	contentLabel.text = content;
	contentLabel.numberOfLines = 0;
	[scrollview addSubview:contentLabel];
	scrollview.contentSize = CGSizeMake(CGRectGetWidth(scrollview.frame), contentSize.height);
	scrollview.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:scrollview];
	
}

- (void)createNavi {

	UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(clickRightBtn)];
	self.navigationItem.rightBarButtonItem = rightBtn;
}

- (void)clickRightBtn {
	[textField resignFirstResponder];
	CGFloat y = [textField.text floatValue];
	[scrollview setContentOffset:CGPointMake(0, y) animated:NO];
}

@end
