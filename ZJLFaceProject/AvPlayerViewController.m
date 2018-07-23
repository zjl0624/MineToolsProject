//
//  AvPlayerViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/6/25.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "AvPlayerViewController.h"
#import<AVFoundation/AVFoundation.h>
@interface AvPlayerViewController ()
@property (weak, nonatomic) IBOutlet UIView *playVier;
@property (nonatomic,strong) AVPlayer * player;
@property (nonatomic,strong) AVPlayerItem *playerItem;
@property (nonatomic,strong) UITapGestureRecognizer *tapGes;
@end

@implementation AvPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self initPlayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)initPlayer
{
	
	// 1、获取媒体资源地址
	NSString *path = [[NSBundle mainBundle] pathForAuxiliaryExecutable:@"localvideo.mp4"];
	path = [NSTemporaryDirectory() stringByAppendingString:@"123.mp4"];
	NSURL *sourceMovieURL = [NSURL fileURLWithPath:path];
	
	// 2、创建AVPlayerItem
	_playerItem = [AVPlayerItem playerItemWithURL:sourceMovieURL];
	// 3、根据AVPlayerItem创建媒体播放器
	_player = [AVPlayer playerWithPlayerItem:_playerItem];
	// 4、创建AVPlayerLayer，用于呈现视频
	AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:_player];
	// 5、设置显示大小和位置
//	playerLayer.bounds = CGRectMake(0, 0, 350, 300);
//	playerLayer.position = CGPointMake(CGRectGetMidX(self.view.bounds), 64 + CGRectGetMidY(playerLayer.bounds) + 30);
	playerLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.playVier.frame), CGRectGetHeight(self.playVier.frame));
	// 6、设置拉伸模式
	playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
	// 7、获取播放持续时间
//	NSLog(@"%lld", _playerItem.duration.value);
	[self.playVier.layer addSublayer:playerLayer];
	_tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapPlayer:)];
	self.playVier.userInteractionEnabled = YES;
	[self.playVier addGestureRecognizer:_tapGes];
	[_playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];// 监听status属性
	[_playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];// 监听loadedTimeRanges属性
	
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
	AVPlayerItem *playerItem = (AVPlayerItem *)object;
	if ([keyPath isEqualToString:@"status"]) {
		if ([playerItem status] == AVPlayerStatusReadyToPlay) {
			NSLog(@"AVPlayerStatusReadyToPlay");
			[_player play];
//			self.stateButton.enabled = YES;
			CMTime duration = self.playerItem.duration;// 获取视频总长度
			CGFloat totalSecond = playerItem.duration.value / playerItem.duration.timescale;// 转换成秒
//			_totalTime = [self convertTime:totalSecond];// 转换成播放时间
//			[self customVideoSlider:duration];// 自定义UISlider外观
			NSLog(@"movie total duration:%f",CMTimeGetSeconds(duration));
//			[self monitoringPlayback:self.playerItem];// 监听播放状态
		} else if ([playerItem status] == AVPlayerStatusFailed) {
			NSLog(@"AVPlayerStatusFailed");
		}
	} else if ([keyPath isEqualToString:@"loadedTimeRanges"]) {
//		NSTimeInterval timeInterval = [self availableDuration];// 计算缓冲进度
//		NSLog(@"Time Interval:%f",timeInterval);
		CMTime duration = self.playerItem.duration;
		CGFloat totalDuration = CMTimeGetSeconds(duration);
//		[self.videoProgress setProgress:timeInterval / totalDuration animated:YES];
	}
}


- (void)tapPlayer:(UITapGestureRecognizer *)ges {
	NSLog(@"点击了播放器中间");
}


- (void)dealloc {
	[_playerItem removeObserver:self forKeyPath:@"status"];
	[_playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
}
@end
