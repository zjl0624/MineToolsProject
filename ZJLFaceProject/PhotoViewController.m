//
//  PhotoViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2018/10/26.
//  Copyright © 2018年 zjlzjl. All rights reserved.
//

#import "PhotoViewController.h"

@interface PhotoViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
@property (strong,nonatomic) UIImagePickerController *imagePicker;
- (IBAction)xiangceAction:(id)sender;

- (IBAction)xiangjiAction:(id)sender;

@end

@implementation PhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
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
