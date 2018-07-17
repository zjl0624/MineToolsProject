//
//  XMLViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/17.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "XMLViewController.h"

@interface XMLViewController ()<NSXMLParserDelegate> {
	NSXMLParser *parser;
}
@property (weak, nonatomic) IBOutlet UITextView *contentTextView;
- (IBAction)readAction:(id)sender;

@end

@implementation XMLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	NSData *data = [[NSData alloc] initWithContentsOfFile:[[NSBundle mainBundle] pathForAuxiliaryExecutable:@"content.xml"]];
	parser = [[NSXMLParser alloc] initWithData:data];
	
	// 设置代理
	parser.delegate = self;
	

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - NSXMLParserDelegate
/**
 * 解析到某个元素的结尾（比如解析</videos>）
 */
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
	
}
/**
 *解析的内容
 */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
	
}
/**
 * 解析到某个元素的开头（比如解析<videos>）
 */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
	
}

/**
 * 开始解析XML文档
 */
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
	NSLog(@"开始解析xml文档");
}

/**
 * 解析完毕
 */
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
	NSLog(@"xml文档解析完毕");
}

- (IBAction)readAction:(id)sender {
	// 开始解析XML(parse方法是阻塞式的)
	[parser parse];
}
@end
