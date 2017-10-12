//
//  PassValueViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/8.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#import "PassValueViewController.h"
#import "ButtonCollectionViewCell.h"
#import "SecondViewController.h"

@interface PassValueViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,ButtonClickDelegate,passValueDelegate> {
	UITextField *textField;
	UILabel *resultLabel;
	UICollectionView *collectionview;
	NSMutableArray *dataArray;
}

@end

@implementation PassValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self initUI];
	
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - passValueDelegate
- (void)passTextFieldValue:(NSString *)text {
	resultLabel.text = text;
}

#pragma mark - ButtonClickDelegate
- (void)clickButton:(ButtonCollectionViewCell *)cell sender:(UIButton *)sender {
	if ([sender.titleLabel.text isEqualToString:@"属性传值"]) {
		if (![textField.text isEqualToString:@""]) {
			SecondViewController *vc = [[SecondViewController alloc] init];
			vc.propertyValue = textField.text;
			vc.delegate = self;
			[self.navigationController pushViewController:vc animated:YES];
		}

	}else if ([sender.titleLabel.text isEqualToString:@"代理传值"]){
		
	}else {
		
	}
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
	return [dataArray count];
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	NSString *cellIdentifier = @"cell";
	ButtonCollectionViewCell *cell = [collectionview dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
	[cell configureCell:dataArray[indexPath.row]];
	cell.delegate = self;
	return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
	if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
		UICollectionReusableView *headerView = [collectionview dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
		textField = [[UITextField alloc] initWithFrame:CGRectMake(10, CGRectGetHeight(headerView.frame)/2 - 16, ScreenWidth - 20, 32)];
		textField.borderStyle = UITextBorderStyleRoundedRect;
		headerView.backgroundColor = [UIColor greenColor];
		[headerView addSubview:textField];
		return headerView;
	}else if([kind isEqualToString:UICollectionElementKindSectionFooter]){
		UICollectionReusableView *footerView = [collectionview dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"footer" forIndexPath:indexPath];
		footerView.backgroundColor = [UIColor yellowColor];
		resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetHeight(footerView.frame)/2 - 16, ScreenWidth - 20, 32)];
		resultLabel.text = @"值为：";
		[footerView addSubview:resultLabel];
		return footerView;
	}else {
		return nil;
	}
}

#pragma mark - private method
- (void)initUI {
	self.automaticallyAdjustsScrollViewInsets = NO;
	self.view.backgroundColor = [UIColor whiteColor];
	UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
	layout.itemSize = CGSizeMake(ScreenWidth/3, 32);
	layout.scrollDirection = UICollectionViewScrollDirectionVertical;
	layout.minimumLineSpacing = 0;
	layout.minimumInteritemSpacing = 0;
	layout.headerReferenceSize = CGSizeMake(ScreenWidth, 64);
	layout.footerReferenceSize = CGSizeMake(ScreenWidth, 64);
	collectionview = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, ScreenWidth, ScreenHeight - 64) collectionViewLayout:layout];
	collectionview.backgroundColor = [UIColor whiteColor];
	collectionview.dataSource = self;
	collectionview.delegate = self;
	[self.view addSubview:collectionview];
	[collectionview registerClass:[ButtonCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
	[collectionview registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
	[collectionview registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"footer"];
	dataArray = [[NSMutableArray alloc] init];
	[dataArray addObject:@"属性传值"];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getNotiValue:) name:@"noti" object:nil];

}

- (void)getNotiValue:(NSNotification *)noti {
	resultLabel.text = noti.userInfo[@"value"];
}

- (void)dealloc {
	[[NSNotificationCenter defaultCenter] removeObserver:self name:@"noti" object:nil];
}
@end
