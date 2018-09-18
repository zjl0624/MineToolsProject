//
//  SecondViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/8.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "SecondViewController.h"
#import "ButtonCollectionViewCell.h"
#define ScreenWidth [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
@interface SecondViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,ButtonClickDelegate>{
	UITextField *textField;
	UILabel *resultLabel;
	UICollectionView *collectionview;
	NSMutableArray *dataArray;
}

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ButtonClickDelegate
- (void)clickButton:(ButtonCollectionViewCell *)cell sender:(UIButton *)sender {
	if ([sender.titleLabel.text isEqualToString:@"属性传值"]) {
		
	}else if ([sender.titleLabel.text isEqualToString:@"代理传值"]){
		if (![textField.text isEqualToString:@""]) {
			[self.delegate passTextFieldValue:textField.text];
		}
		
	}else if ([sender.titleLabel.text isEqualToString:@"通知传值"]){
		if (![textField.text isEqualToString:@""]) {
			[[NSNotificationCenter defaultCenter] postNotificationName:@"noti" object:nil userInfo:@{@"value":textField.text}];
		}
    }else if ([sender.titleLabel.text isEqualToString:@"block传值"]) {
        if (![textField.text isEqualToString:@""]) {
            self.block(textField.text);
        }
    }
    [self.navigationController popViewControllerAnimated:YES];
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
		resultLabel.text = [NSString stringWithFormat:@"值为：%@",self.propertyValue];
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
	[dataArray addObject:@"代理传值"];
	[dataArray addObject:@"通知传值"];
    [dataArray addObject:@"block传值"];
}

- (void)dealloc {
    
}
@end
