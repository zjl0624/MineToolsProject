//
//  JSOCViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/12.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "JSOCViewController.h"
#import "OCModel.h"

@interface JSOCViewController ()<UIWebViewDelegate,CallBackDelegate> {
	JSContext *context;
}
@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end

@implementation JSOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	_webView.delegate = self;
	
	NSString *httpStr=@"https://www.baidu.com";
	NSString *path = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"html"];
	NSURL *httpUrl=[NSURL URLWithString:path];
	NSURLRequest *httpRequest=[NSURLRequest requestWithURL:httpUrl];
	[_webView loadRequest:httpRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView {
	//首先创建JSContext 对象（此处通过当前webView的键获取到jscontext）
	context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
	//加载js代码
	NSString *alertJS=@"alert('加载js代码')"; //准备执行的js代码
	[context evaluateScript:alertJS];//通过oc方法调用js的alert
	

	
	//js调用oc方法
	context[@"showAB"] = ^() {
		NSArray *args = [JSContext currentArguments];
		for (id obj in args) {
			NSLog(@"%@",obj);
		}
	};
	context[@"doSomethingThenCallBack"] = ^(){
		NSArray *args = [JSContext currentArguments];
//		NSInteger sum = 0;
		NSMutableString *str = [[NSMutableString alloc] init];
		for (id obj in args) {
//			sum = sum + [obj toInt32];
			[str appendString:[obj toString]];
			NSLog(@"%@",obj);
		}
		//调用js方法回调
		JSValue *callBack = [JSContext currentContext][@"callback"];
		[callBack callWithArguments:@[str]];
	};
	
	
	//用协议实现js调oc
	OCModel *o = [[OCModel alloc] init];
	context[@"OCModel"] = o;
	o.delegate = self;
}

#pragma mark - CallBackDelegate
- (void)showABCallBack:(NSString *)strA b:(NSString *)strB {
	JSValue *callBack = [JSContext currentContext][@"showABcallback"];
	[callBack callWithArguments:@[strA,strB]];
}

@end
