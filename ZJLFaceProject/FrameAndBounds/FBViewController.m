//
//  FBViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/10.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "FBViewController.h"

@interface FBViewController ()<UITextFieldDelegate>
@property (nonatomic,strong) UIView *backView;
@property (nonatomic,strong) UIView *contentView;
@property (nonatomic,strong) UITextField *textField;
@end

@implementation FBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	_backView = [[UIView alloc] initWithFrame:CGRectMake(0, 88, 120, 120)];
//	_backView.bounds = CGRectMake(50, 0, 120, 120);
	_backView.backgroundColor = [UIColor redColor];
	[self.view addSubview:_backView];
	
	_contentView = [[UIView alloc] init];
	_contentView.frame = CGRectMake(0, 0, 60, 60);
	_contentView.backgroundColor = [UIColor yellowColor];
	[_backView addSubview:_contentView];
	
	_textField = [[UITextField alloc] initWithFrame:CGRectMake(10, [UIScreen mainScreen].bounds.size.height - 30 - 10, [UIScreen mainScreen].bounds.size.width - 20, 30)];
	_textField.layer.borderWidth = 1;
	_textField.layer.borderColor = [UIColor blackColor].CGColor;
	_textField.delegate = self;
	[self.view addSubview:_textField];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showKeyBoard:) name:UIKeyboardWillShowNotification object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideKeyBoard) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	[textField resignFirstResponder];
	return YES;
}

#pragma mark - NSNotification
- (void)showKeyBoard:(NSNotification *) noti{
	CGRect keyBoardRect=[noti.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
	CGFloat deltaY=keyBoardRect.size.height;
	self.view.bounds = CGRectMake(0, deltaY,self.view.bounds.size.width, self.view.bounds.size.height);
}

- (void)hideKeyBoard {
	self.view.bounds = CGRectMake(0, 0,self.view.bounds.size.width, self.view.bounds.size.height);
}
@end
