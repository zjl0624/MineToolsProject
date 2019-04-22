//
//  PhotoViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/10/26.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "PhotoViewController.h"
#import "UIImageView+AFNetworking.h"
#import <Photos/Photos.h>
@interface PhotoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong,nonatomic) UIImagePickerController *imagePicker;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
- (IBAction)xiangceAction:(id)sender;

- (IBAction)xiangjiAction:(id)sender;
- (IBAction)saveAction:(id)sender;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *imageUrl = @"http://p1.qzone.la/Upload/20160309/20160309193722609423.jpg";
    [_iconImageView setImageWithURL:[NSURL URLWithString:imageUrl]];
}


- (UIImagePickerController *)imagePicker {
    if (!_imagePicker) {
        _imagePicker = [[UIImagePickerController alloc] init];
        _imagePicker.delegate = self;
    }
    return _imagePicker;
}

- (IBAction)xiangceAction:(id)sender {
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    self.imagePicker.allowsEditing = YES;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

- (IBAction)xiangjiAction:(id)sender {
    self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    [self presentViewController:self.imagePicker animated:YES completion:nil];
}

- (IBAction)saveAction:(id)sender {
//    UIImageWriteToSavedPhotosAlbum(self.iconImageView.image, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    
    [PHPhotoLibrary requestAuthorization:^(PHAuthorizationStatus status) {
        if (status == PHAuthorizationStatusAuthorized) {
            
            [[PHPhotoLibrary sharedPhotoLibrary]performChanges:^{
                [PHAssetChangeRequest creationRequestForAssetFromImage:self.iconImageView.image];
            } completionHandler:^(BOOL success, NSError * _Nullable error) {
                if (error) {
                    NSLog(@"%@",@"保存失败");
                } else {
                    NSLog(@"%@",@"保存成功");
                }
            }];
        } else {

        }
    }];

    


}

-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *msg = nil ;
    if(error){
        msg = @"保存图片失败" ;
    }else{
        msg = @"保存图片成功" ;
    }
}
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera) {
        if ([info[UIImagePickerControllerMediaType] isEqualToString:@"public.image"]) {
            UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
            //            _headPortraitImageView.image = originalImage;
        }
    }else if (picker.sourceType == UIImagePickerControllerSourceTypePhotoLibrary){
        if ([info[UIImagePickerControllerMediaType] isEqualToString:@"public.image"]) {
            UIImage *originalImage = info[UIImagePickerControllerOriginalImage];
        }
    }
    
    [_imagePicker dismissViewControllerAnimated:YES completion:nil];
}



- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [_imagePicker dismissViewControllerAnimated:YES completion:nil];
}


@end
