//
//  OCModel.h
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/13.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>


@protocol CallBackDelegate
@optional
- (void)showABCallBack:(NSString *)strA b:(NSString *)strB;

@end

@protocol OCModelDelegate<JSExport>

- (void)show;
- (void)showA:(NSString *)strA B:(NSString *)strB;

@end
@interface OCModel : NSObject<OCModelDelegate>
@property (nonatomic,weak) id<CallBackDelegate> delegate;

@end
