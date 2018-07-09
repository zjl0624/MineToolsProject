//
//  NSObject+SwithToModel.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/13.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "NSObject+SwithToModel.h"
#import <objc/runtime.h>

@implementation NSObject (SwithToModel)
- (id)jsonToModel:(NSString *)jsonStr {

//	Class cls = [self class];
	NSDictionary *jsonDic;
	if (![jsonStr isEqualToString:@""]) {
		NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
		jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
	}else {
		jsonDic = @{@"Code":@"1000",@"Msg":@"获取成功",@"Data":@[@{@"userId":@"2",@"bookName":@"书籍4"},@{@"userId":@"3",@"bookName":@"书籍5"}]};
	}
	[self finishToModel:[self class] jsonDic:jsonDic object:self];
	return self;

}

- (id)finishToModel:(Class)class jsonDic:(NSDictionary *)jsonDic object:(id)object{
	NSArray *propertiesArray = [self getAllProperties:class];
	for (NSString *key in jsonDic) {
//		id objc = [[class alloc] init];
		for (NSString *prop in propertiesArray) {
			if ([prop isEqualToString:key]) {
//				NSString *str = prop;
//				if (![superProp isEqualToString:@""]) {
//					str = [NSString stringWithFormat:@"%@.%@",superProp,prop];
//				}

//				[self setValue:jsonDic[key] forKey:str];
				if ([jsonDic[key] isKindOfClass:[NSDictionary class]]) {
					break;
				}else if ([jsonDic[key] isKindOfClass:[NSArray class]]) {
					NSArray *jsonArr = jsonDic[key];
					NSMutableArray *arr = [[NSMutableArray alloc] init];
					[jsonArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
					id o = [self finishToModel:[NSClassFromString(key) class] jsonDic:obj object:[[NSClassFromString(key) alloc] init]];
						[arr addObject:o];
					}];
					Ivar ivar = class_getInstanceVariable(class, [[NSString stringWithFormat:@"_%@",key] UTF8String]);
					object_setIvar(object, ivar, arr);
					break;
				}else {
					Ivar ivar = class_getInstanceVariable(class, [[NSString stringWithFormat:@"_%@",key] UTF8String]);
					object_setIvar(object, ivar, jsonDic[key]);
					break;
				}
			}
		}
	}
	return object;
}


//获取对象的所有属性，不包括属性值
- (NSArray *)getAllProperties:(Class)class
{
	u_int count;
	objc_property_t *properties  =class_copyPropertyList(class, &count);
	NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
	for (int i = 0; i<count; i++)
	{
		const char* propertyName =property_getName(properties[i]);
		[propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
	}
	free(properties);
	return propertiesArray;
}

//获取对象的所有属性 以及属性值
- (NSDictionary *)properties_aps
{
	NSMutableDictionary *props = [NSMutableDictionary dictionary];
	unsigned int outCount, i;
	objc_property_t *properties = class_copyPropertyList([self class], &outCount);
	for (i = 0; i<outCount; i++)
	{
		objc_property_t property = properties[i];
		const char* char_f =property_getName(property);
		NSString *propertyName = [NSString stringWithUTF8String:char_f];
		id propertyValue = [self valueForKey:(NSString *)propertyName];
		if (propertyValue) [props setObject:propertyValue forKey:propertyName];
	}
	free(properties);
	return props;
}

/* 获取对象的所有方法 */
- (void)printMothList
{
	unsigned int mothCout_f =0;
	Method* mothList_f = class_copyMethodList([self class],&mothCout_f);
	for(int i=0;i<mothCout_f;i++)
	{
		Method temp_f = mothList_f[i];
//		IMP imp_f = method_getImplementation(temp_f);
//		SEL name_f = method_getName(temp_f);
		const char* name_s =sel_getName(method_getName(temp_f));
		int arguments = method_getNumberOfArguments(temp_f);
		const char* encoding =method_getTypeEncoding(temp_f);
		NSLog(@"方法名：%@,参数个数：%d,编码方式：%@",[NSString stringWithUTF8String:name_s],
			  arguments,[NSString stringWithUTF8String:encoding]);
	}
	free(mothList_f);
}
@end
