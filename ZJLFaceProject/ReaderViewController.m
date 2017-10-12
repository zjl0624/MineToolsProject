//
//  ReaderViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/11.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "ReaderViewController.h"
#import "SaveIndex.h"
#import "UserSettings.h"
#import "DataSource.h"
#import "CollectionDelegate.h"
#import "MenuView.h"
#import "ProgressSliderView.h"

#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ViewHeight ([UIScreen mainScreen].bounds.size.height - 64)
#define MenuViewHeight 64
#define SliderViewHeight 64
@interface ReaderViewController () <UITextViewDelegate,MenuClickItemDelegate,SliderDelegate,ScrollDelegate>{
	UITextView *contentTextView;
	DataSource *collectionDataSource;
	UICollectionView *collectionview;
	CollectionDelegate *collectionDelegate;
	NSMutableArray *dataArray;
	BOOL isHiddenNavi;
	MenuView *menuView;
	ProgressSliderView *sliderView;
}

@end

@implementation ReaderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[UserSettings unArchiver];
	[self createNavi];
	[self initUI];
	[self createMenuView];
	
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.navigationController setNavigationBarHidden:YES animated:YES];

}

- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
	[self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
//	CGFloat y = [SaveIndex readContentOffsetY];
	CGFloat y = [UserSettings sharedInstance].index;
	[collectionview setContentOffset:CGPointMake(0, y) animated:NO];
	collectionview.hidden = NO;
//	contentTextView.hidden = NO;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - ScrollDelegate
- (void)didScroll:(float)percent {
	[self finishSlide:percent isSetY:NO];
}

#pragma mark - MenuClickItemDelegate
- (void)clickItem:(MenuItemType)type {
	if (type == ProgressSlider) {
		if (!sliderView) {
			[self createSliderView];
		}
		[self showSlider];
	}else if (type == Usersetting) {
		
	}
}


#pragma mark - SliderDelegate
- (void)finishSlide:(float)percent isSetY:(BOOL)isSetY {
	float y = percent/100 * collectionview.contentSize.height;
	float sliderWidth = CGRectGetWidth(sliderView.slider.frame);
	sliderView.percentLabel.frame = CGRectMake(sliderWidth * percent / 100 + 64, 0, 40, 20);
	sliderView.percentLabel.text = [NSString stringWithFormat:@"%.4f",percent/100];
	NSLog(@"%.2f",percent/100);
	if (isSetY) {
		[collectionview setContentOffset:CGPointMake(0, y) animated:NO];
	}
}

- (void)finishSlide:(float)percent {
	[self finishSlide:percent isSetY:YES];
}

- (void)sliding:(float)percent {
//	float sliderWidth = CGRectGetWidth(sliderView.slider.frame);
//	sliderView.percentLabel.frame = CGRectMake(sliderWidth * percent / 100, 0, 30, 20);
//	sliderView.percentLabel.text = [NSString stringWithFormat:@"%.2f",percent/100];
//	NSLog(@"%.2f",percent/100);
}
#pragma mark - private method
- (void)createNavi {
	isHiddenNavi = YES;
	
	UIButton *leftBtn = [[UIButton alloc] init];
	[leftBtn setImage:[UIImage imageNamed:@"back.jpg"] forState:UIControlStateNormal];
	[leftBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
	[leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
	leftBtn.frame = CGRectMake(0, 0, 44, 44);
	leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -44, 0, 0);
	UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
	self.navigationItem.leftBarButtonItem = leftItem;
}

- (void)initUI {
	self.automaticallyAdjustsScrollViewInsets = NO;
	if ([UserSettings sharedInstance].bgColor == white) {
		self.view.backgroundColor = [UIColor whiteColor];
	}else {
		self.view.backgroundColor = [UIColor redColor];
	}

	contentTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64)];
	contentTextView.editable = NO;
	if ([UserSettings sharedInstance].fontSize == 0) {
		[UserSettings sharedInstance].fontSize = 18;
	}
	contentTextView.font = [UIFont systemFontOfSize:[UserSettings sharedInstance].fontSize];
	[self.view addSubview:contentTextView];
	contentTextView.text = [self read];
	UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapTextView:)];
	[contentTextView addGestureRecognizer:tap1];
	contentTextView.delegate = self;
	contentTextView.hidden = YES;

	
//	UIBarButtonItem *rightBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(clickRightBtn)];
//	self.navigationItem.rightBarButtonItem = rightBtn;
	
	dataArray = [[NSMutableArray alloc] init];
	UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
	layout.minimumLineSpacing = 0;
	layout.minimumInteritemSpacing = 0;
	collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) collectionViewLayout:layout];
	collectionview.backgroundColor = self.view.backgroundColor;
	[self.view addSubview:collectionview];
	collectionview.hidden = YES;
	collectionDelegate = [[CollectionDelegate alloc] initWithSelectedBlock:^(NSIndexPath *indexPath) {
		
	}];
	collectionDelegate.scrollDelegate = self;
	collectionview.delegate = collectionDelegate;
	
	NSString *allContent = [self read];
	CGSize oneLineSize = [allContent boundingRectWithSize:CGSizeMake(ScreenWidth, 10000000) options:NSStringDrawingTruncatesLastVisibleLine attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:[UserSettings sharedInstance].fontSize]} context:nil].size;
	int line = ScreenHeight/oneLineSize.height;
//	CGSize allContentSize = [allContent boundingRectWithSize:CGSizeMake(ScreenWidth, 10000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:[UserSettings sharedInstance].fontSize]} context:nil].size;
	int num = ScreenWidth/oneLineSize.height;
	int range = num * line;
	for (float i = 0;i < allContent.length; i = i + range) {
		NSString *pageStr;
		NSRange location = NSMakeRange(i, range);
		if (i + range > allContent.length) {
			location = NSMakeRange(i, allContent.length - i);
		}
		pageStr = [allContent substringWithRange:location];
		[dataArray addObject:pageStr];
	}
	[collectionview registerNib:[UINib nibWithNibName:@"ContentCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"cell"];
	collectionDataSource = [[DataSource alloc] initWithDataArray:dataArray numberOfSection:1 cellIDConfigureBlock:^NSString *(NSIndexPath *indexPath, id model) {
		return @"cell";
	} cellConfigure:^(NSIndexPath *indexPath, id model, id cell) {
		
	}];
	collectionview.dataSource = collectionDataSource;
	UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapCollectionView:)];
	[collectionview addGestureRecognizer:tap];
}

- (NSString *)read {
	NSError *error;
	 NSStringEncoding gbkEncoding = CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000);
	NSString *filePath = [[NSBundle mainBundle] pathForResource:@"冰火魔厨" ofType:@"txt"];
	NSString *content = [NSString stringWithContentsOfFile:filePath encoding:gbkEncoding error:&error];
	return content;
}


- (void)tapTextView:(UITapGestureRecognizer *)tap {
	CGPoint location = [tap locationInView:self.view];
	if ([self isTapCenter:location]) {
		NSLog(@"点了中间");
	}else if ([self isTapLeft:location]){
		NSLog(@"点了左边");
	}else {
		NSLog(@"点了右边");
	}
}
- (void)tapCollectionView:(UITapGestureRecognizer *)tap {
	CGPoint location = [tap locationInView:self.view];
	if ([UserSettings sharedInstance].isPage) {
		if ([self isTapCenter:location]) {
			[self tapCenter];
			NSLog(@"点了中间");
		}else if ([self isTapLeft:location]){
			NSLog(@"点了左边");
		}else {
			NSLog(@"点了右边");
		}
	}else {
		[self tapCenter];
		NSLog(@"点了中间");
	}

}
- (BOOL)isTapCenter:(CGPoint)location {
	if (location.x >= ScreenWidth/4 && location.x <= ScreenWidth/4 * 3 && location.y >= ViewHeight/5 && location.y <= ViewHeight/5 * 4) {
		return YES;
	}else {
		return NO;
	}
}

- (BOOL)isTapLeft:(CGPoint)location {
	if (location.x <= ScreenWidth/2) {
		return YES;
	}else {
		return NO;
	}
}

- (void)tapCenter {
	[self hideSlider];
	isHiddenNavi = !isHiddenNavi;
	[self.navigationController setNavigationBarHidden:isHiddenNavi animated:YES];
	if (isHiddenNavi) {
		[self hideMenu];
	}else {
		[self showMenu];
	}

}
- (void)createMenuView {
	menuView = [[MenuView alloc] initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 0)];
	menuView.menuItemDelegate = self;
	[self.view addSubview:menuView];
	
}
- (void)showMenu {
	[UIView animateWithDuration:0.25 animations:^{
		menuView.frame = CGRectMake(0, ScreenHeight - MenuViewHeight, ScreenWidth, MenuViewHeight);
	}];
}

- (void)hideMenu {
	[UIView animateWithDuration:0.25 animations:^{
		menuView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 0);
	}];
}
- (void)createSliderView {
	sliderView = [[ProgressSliderView alloc] initWithFrame:CGRectMake(0, ScreenHeight, ScreenWidth, 0)];
	sliderView.hidden = YES;
	sliderView.delegate = self;
	[self.view addSubview:sliderView];
}

- (void)showSlider {
	sliderView.hidden = NO;
	float currentValue = [UserSettings sharedInstance].index /collectionview.contentSize.height * 100;
	sliderView.currentValue = currentValue;
	[UIView animateWithDuration:0.25 animations:^{
		sliderView.frame = CGRectMake(0, ScreenHeight - SliderViewHeight, ScreenWidth, SliderViewHeight);
	}];
}

- (void)hideSlider {
	[UIView animateWithDuration:0.25 animations:^{
		sliderView.frame = CGRectMake(0, ScreenHeight, ScreenWidth, 0);
	} completion:^(BOOL finished) {
		sliderView.hidden = YES;
	}];
}

- (void)back {
	[self.navigationController popViewControllerAnimated:YES];
}
- (void)clickRightBtn {
	float y = [UserSettings sharedInstance].index;
	[contentTextView setContentOffset:CGPointMake(0, y) animated:NO];
}

- (void)dealloc {
//	[UserSettings sharedInstance].index = collectionview.contentOffset.y;
//	NSLog(@"%.2f",[UserSettings sharedInstance].index);
//	[UserSettings Archiver];
}

- (BOOL)prefersStatusBarHidden {
	return isHiddenNavi;
}

@end
