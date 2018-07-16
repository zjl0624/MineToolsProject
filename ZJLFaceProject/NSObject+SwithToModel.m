//
//  NSObject+SwithToModel.m
//  ZJLFaceProject
//
//  Created by zjl on 2017/6/13.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import "NSObject+SwithToModel.h"
#import <objc/runtime.h>
#import "BaseModel.h"

@implementation NSObject (SwithToModel)
+ (id)jsonToModel:(NSString *)jsonStr {

	NSDictionary *jsonDic;
	if (![jsonStr isEqualToString:@""]) {
		NSData *jsonData = [jsonStr dataUsingEncoding:NSUTF8StringEncoding];
		jsonDic = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:nil];
	}else {
		jsonDic = @{@"Content":@{@"author":@"haha",@"age":@"40"},@"Code":@"1000",@"Msg":@"获取成功",@"Data":@[@{@"userId":@"2",@"bookName":@"书籍4"},@{@"userId":@"3",@"bookName":@"书籍5"}]};
	}
	id obj = [self finishToModel:[self class] jsonDic:jsonDic];
	return obj;

}

- (id)finishToModel:(Class)class jsonDic:(NSDictionary *)jsonDic{
	id object = [[class alloc] init];
	NSArray *propertiesArray = [self getAllProperties:class];
	for (NSString *key in jsonDic) {
		for (NSString *prop in propertiesArray) {
			if ([self propertyIsEqual:prop toKey:key withClass:class]) {
				if ([jsonDic[key] isKindOfClass:[NSDictionary class]]) {
					NSDictionary *subDic = jsonDic[key];
					id o = [self finishToModel:[NSClassFromString(prop) class] jsonDic:subDic];
					Ivar ivar = class_getInstanceVariable(class, [[NSString stringWithFormat:@"_%@",prop] UTF8String]);
					object_setIvar(object, ivar, o);
					break;
				}else if ([jsonDic[key] isKindOfClass:[NSArray class]]) {
					NSArray *jsonArr = jsonDic[key];
					NSMutableArray *arr = [[NSMutableArray alloc] init];
					[jsonArr enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
					id o = [self finishToModel:[NSClassFromString(prop) class] jsonDic:obj];
						[arr addObject:o];
					}];
					Ivar ivar = class_getInstanceVariable(class, [[NSString stringWithFormat:@"_%@",prop] UTF8String]);
					object_setIvar(object, ivar, arr);
					break;
				}else {
					Ivar ivar = class_getInstanceVariable(class, [[NSString stringWithFormat:@"_%@",prop] UTF8String]);
					object_setIvar(object, ivar, jsonDic[key]);
					break;
				}
			}
		}
	}
	return object;
}


- (NSString *)getPropertyName:(NSString *)key withClass:(Class)class{
	NSDictionary *propertyNameDic = nil;
	if ([class respondsToSelector:@selector(propertyNameDic)]) {
		propertyNameDic = [class propertyNameDic];
	}
	for (NSString *k in propertyNameDic) {
		if ([propertyNameDic[k] isEqualToString:key]) {
			return k;
		}
	}
	return key;
}

- (BOOL)propertyIsEqual:(NSString *)prop toKey:(NSString *)key withClass:(Class)class{
	if ([prop isEqualToString:key]) {
		return YES;
	}
	
	NSDictionary *propertyNameDic = nil;
	if ([class respondsToSelector:@selector(propertyNameDic)]) {
		propertyNameDic = [class propertyNameDic];
	}
	if ([propertyNameDic[key] isEqualToString:prop]) {
		return YES;
	}else {
		return NO;
	}
}
//获取对象的所有属性，不包括属性值
- (NSArray *)getAllProperties:(Class)class
{
	u_int count;
	objc_property_t *properties  = class_copyPropertyList(class, &count);
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
