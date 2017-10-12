//
//  ProgressSliderView.h
//  ZJLFaceProject
//
//  Created by zjl on 2017/8/16.
//  Copyright © 2017年 zjlzjl. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol SliderDelegate
- (void)finishSlide:(float)percent;

- (void)sliding:(float)percent;
@end
@interface ProgressSliderView : UIView {

}
@property (nonatomic,strong) UILabel *percentLabel;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak,nonatomic) id<SliderDelegate> delegate;
@property (nonatomic,assign) float currentValue;
- (instancetype)initWithFrame:(CGRect)frame;
@end
