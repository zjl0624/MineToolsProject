//
//  LocationModel.h
//  ZJLFaceProject
//
//  Created by zjl on 2018/11/7.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LocationModel : NSObject<NSCoding>
@property (nonatomic,copy) NSString *dateStr;
@property (nonatomic,copy) NSString *detail;
@property (nonatomic,assign) BOOL isBackground;
@end

NS_ASSUME_NONNULL_END
