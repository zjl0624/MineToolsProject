//
//  RecordingVideoViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/7/5.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "RecordingVideoViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface RecordingVideoViewController ()<AVCaptureFileOutputRecordingDelegate>
- (IBAction)startAction:(id)sender;
@property (nonatomic,strong) AVCaptureSession *captureSession;
@property (nonatomic,strong) AVCaptureDeviceInput *videoCaptureDeviceInput;//视频输入对象
@property (nonatomic,strong) AVCaptureDeviceInput *audioCaptureDeviceInput;//音频输入对象
@property (nonatomic,strong) AVCaptureMovieFileOutput *caputureMovieFileOutput;//输出对象

@property (nonatomic,strong) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;//预览层

@end

@implementation RecordingVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	[self initCapture];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initCapture {
	NSError *error;
	// 创建会话 (AVCaptureSession) 对象。
	_captureSession = [[AVCaptureSession alloc] init];
	if ([_captureSession canSetSessionPreset:AVCaptureSessionPreset640x480]) {
		// 设置会话的 sessionPreset 属性, 这个属性影响视频的分辨率
		[_captureSession setSessionPreset:AVCaptureSessionPreset640x480];
	}
	
	// 获取摄像头输入设备， 创建 AVCaptureDeviceInput 对象
	// 在获取摄像头的时候，摄像头分为前后摄像头，我们创建了一个方法通过用摄像头的位置来获取摄像头
	AVCaptureDevice *videoCaptureDevice = [self getCameraDeviceWithPosition:AVCaptureDevicePositionBack];
	if (!videoCaptureDevice) {
		NSLog(@"---- 取得后置摄像头时出现问题---- ");
		return;
	}
	
	// 添加一个音频输入设备
	// 直接可以拿数组中的数组中的第一个
	AVCaptureDevice *audioCaptureDevice = [[AVCaptureDevice devicesWithMediaType:AVMediaTypeAudio] firstObject];
	
	// 视频输入对象
	// 根据输入设备初始化输入对象，用户获取输入数据
	_videoCaptureDeviceInput = [[AVCaptureDeviceInput alloc] initWithDevice:videoCaptureDevice error:&error];
	if (error) {
		NSLog(@"---- 取得设备输入对象时出错 ------ %@",error);
		return;
	}
	
	//  音频输入对象
	//根据输入设备初始化设备输入对象，用于获得输入数据
	_audioCaptureDeviceInput = [[AVCaptureDeviceInput alloc] initWithDevice:audioCaptureDevice error:&error];
	if (error) {
		NSLog(@"取得设备输入对象时出错 ------ %@",error);
		return;
	}
	
	// 初始化输出设备对象，用户获取输出数据
	_caputureMovieFileOutput = [[AVCaptureMovieFileOutput alloc] init];
	[_captureSession addOutput:_caputureMovieFileOutput];
	// 将视频输入对象添加到会话 (AVCaptureSession) 中
	if ([_captureSession canAddInput:_videoCaptureDeviceInput]) {
		[_captureSession addInput:_videoCaptureDeviceInput];
	}
	
	// 将音频输入对象添加到会话 (AVCaptureSession) 中
	if ([_captureSession canAddInput:_audioCaptureDeviceInput]) {
		[_captureSession addInput:_audioCaptureDeviceInput];
		AVCaptureConnection *captureConnection = [_caputureMovieFileOutput connectionWithMediaType:AVMediaTypeVideo];
		// 标识视频录入时稳定音频流的接受，我们这里设置为自动
		if ([captureConnection isVideoStabilizationSupported]) {
			captureConnection.preferredVideoStabilizationMode = AVCaptureVideoStabilizationModeAuto;
		}
	}
	
	// 显示在视图表面的图层
	CALayer *layer = self.view.layer;
	layer.masksToBounds = true;
	
	_captureVideoPreviewLayer = [AVCaptureVideoPreviewLayer layerWithSession:_captureSession];
	_captureVideoPreviewLayer.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 250);
	_captureVideoPreviewLayer.masksToBounds = true;
	_captureVideoPreviewLayer.videoGravity=AVLayerVideoGravityResizeAspectFill;//填充模式
	[layer addSublayer:_captureVideoPreviewLayer];
	

}

- (AVCaptureDevice *)getCameraDeviceWithPosition:(AVCaptureDevicePosition)pos {
//	AVCaptureDevice *videoDevice = [AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInDuoCamera mediaType:AVMediaTypeVideo position:AVCaptureDevicePositionBack];
	AVCaptureDevice *videoDevice = [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
	if ( ! videoDevice ) {
		// If the back dual camera is not available, default to the back wide angle camera.
		videoDevice = [AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInWideAngleCamera mediaType:AVMediaTypeVideo position:AVCaptureDevicePositionBack];
		// In some cases where users break their phones, the back wide angle camera is not available. In this case, we should default to the front wide angle camera.
		if ( ! videoDevice ) {
			videoDevice = [AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInWideAngleCamera mediaType:AVMediaTypeVideo position:AVCaptureDevicePositionFront];
		}
	}
	return videoDevice;
//	switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo]) {        case AVAuthorizationStatusAuthorized:         {
//		return [AVCaptureDevice defaultDeviceWithDeviceType:AVCaptureDeviceTypeBuiltInDuoCamera mediaType:AVMediaTypeVideo position:pos];
//	}
//		case AVAuthorizationStatusNotDetermined:         {
//			//目前用户为选择
////			dispatch_suspend(self.sessionQueue);//self.seaaionQueue 是串行线程
//			[AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
////				if (!granted) {
////					self.setupResult = FYCameraCaptureSetupResultNotAuthorized;                 }
////				dispatch_resume(self.sessionQueue);
//
//			}];
//			return nil;
//		}
//		default:
//		{
//			//处理其余情况
//			return nil;
//
//		}
//
//	}

}
- (IBAction)startAction:(id)sender {
	[(UIButton *)sender setSelected:![(UIButton *)sender isSelected]];
	if ([(UIButton *)sender isSelected]) {
		// 让输入输出，然后把视图渲染到预览层上
		[_captureSession startRunning];
		AVCaptureConnection *captureConnection=[self.caputureMovieFileOutput connectionWithMediaType:AVMediaTypeVideo];
		// 开启视频防抖模式
		AVCaptureVideoStabilizationMode stabilizationMode = AVCaptureVideoStabilizationModeCinematic;
		if ([self.videoCaptureDeviceInput.device.activeFormat isVideoStabilizationModeSupported:stabilizationMode]) {
			[captureConnection setPreferredVideoStabilizationMode:stabilizationMode];
		}
		
		//如果支持多任务则则开始多任务
//		if ([[UIDevice currentDevice] isMultitaskingSupported]) {
//			self.backgroundTaskIdentifier = [[UIApplication sharedApplication] beginBackgroundTaskWithExpirationHandler:nil];
//		}
		// 预览图层和视频方向保持一致,这个属性设置很重要，如果不设置，那么出来的视频图像可以是倒向左边的。
		captureConnection.videoOrientation=[self.captureVideoPreviewLayer connection].videoOrientation;
		
		// 设置视频输出的文件路径，这里设置为 temp 文件
		NSString *outputFielPath=[NSTemporaryDirectory() stringByAppendingString:@"123.mp4"];
		
		// 路径转换成 URL 要用这个方法，用 NSBundle 方法转换成 URL 的话可能会出现读取不到路径的错误
		NSURL *fileUrl=[NSURL fileURLWithPath:outputFielPath];
		
		// 往路径的 URL 开始写入录像 Buffer ,边录边写
		[self.caputureMovieFileOutput startRecordingToOutputFileURL:fileUrl recordingDelegate:self];
	}
	else {
		// 取消视频拍摄
		[self.caputureMovieFileOutput stopRecording];
		[self.captureSession stopRunning];
//		[self completeHandle];
	}
}


- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didStartRecordingToOutputFileAtURL:(NSURL *)fileURL fromConnections:(NSArray *)connections
{
	NSLog(@"---- 开始录制 ----");
}

- (void)captureOutput:(AVCaptureFileOutput *)captureOutput didFinishRecordingToOutputFileAtURL:(NSURL *)outputFileURL fromConnections:(NSArray *)connections error:(NSError *)error
{
	NSLog(@"---- 录制结束 ----");
	NSString *outputFielPath=[NSTemporaryDirectory() stringByAppendingString:@"123.mp4"];
	NSDictionary *outputFileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:outputFielPath error:nil];
	NSLog (@"file size: %f", (unsigned long long)[outputFileAttributes fileSize]/1024.00 /1024.00);
}
@end
