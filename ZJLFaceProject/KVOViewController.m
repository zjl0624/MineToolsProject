//
//  KVOViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/14.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "KVOViewController.h"
#import "KVOModel.h"

@interface KVOViewController ()<UITextFieldDelegate>{
	UITextField *textfield;
	UILabel *resultLabel;
}

@end

@implementation KVOViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self initUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITextFieldDelegate

#pragma mark - Initui
- (void)initUI {
	self.view.backgroundColor = [UIColor whiteColor];
	textfield = [[UITextField alloc] initWithFrame:CGRectMake(40, 84, [UIScreen mainScreen].bounds.size.width - 80, 40)];
	textfield.delegate = self;
	[self.view addSubview:textfield];
	[textfield addTarget:self action:@selector(textfieldChange) forControlEvents:UIControlEventEditingChanged];
	
	resultLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMinX(textfield.frame), CGRectGetMaxY(textfield.frame) + 20, CGRectGetWidth(textfield.frame), 40)];
	[self.view addSubview:resultLabel];
	
	[[KVOModel sharedKVOModel] addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:@"哈哈"];
}


#pragma mark - KVO
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
	resultLabel.text = change[@"new"];
}

#pragma mark - private method
- (void)textfieldChange {
//	[[KVOModel sharedKVOModel] setText:textfield.text];
	[[KVOModel sharedKVOModel] setValue:textfield.text forKey:@"text"];
//	[[KVOModel sharedKVOModel] changeText:textfield.text];
}

- (void)dealloc {
	[[KVOModel sharedKVOModel] removeObserver:self forKeyPath:@"text"];
}
@end
