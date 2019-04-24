//
//  UseQueueViewController.m
//  ZJLFaceProject
//
//  Created by zjl on 2019/4/23.
//  Copyright © 2019年 zjlzjl. All rights reserved.
//

#import "UseQueueViewController.h"

@interface UseQueueViewController ()
@property (nonatomic,strong) UIButton *insertButton;
@property (nonatomic,strong) UIButton *pauseButton;
@property (nonatomic,strong) NSOperationQueue *queue;
@property (nonatomic,assign) NSInteger index;
@end

@implementation UseQueueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _index = 1;
    self.view.backgroundColor = [UIColor whiteColor];
    _queue = [[NSOperationQueue alloc] init];
    _queue.maxConcurrentOperationCount = 1;
    _insertButton = [[UIButton alloc] initWithFrame:CGRectMake(20, 200, 100, 60)];
    [_insertButton setTitle:@"加入队列" forState:UIControlStateNormal];
    [_insertButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:_insertButton];
    [_insertButton addTarget:self action:@selector(clickInsert) forControlEvents:UIControlEventTouchUpInside];
    
    _pauseButton = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(_insertButton.frame) + 30, 100, 60)];
    [_pauseButton setTitle:@"暂停队列" forState:UIControlStateNormal];
    [_pauseButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:_pauseButton];
//    [_pauseButton addTarget:self action:@selector(clickPause) forControlEvents:UIControlEventTouchUpInside];
    for (NSInteger i = 0; i < 3; i++) {
        [self clickInsert];
    }
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i = 0; i < 3; i++) {
            [self clickInsert];
        }
    });
}

- (void)clickInsert {
    __weak __typeof(&*self)weakSelf = self;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [weakSelf.queue addOperationWithBlock:^{
            NSLog(@"任务%ld开始",(long)weakSelf.index);
            weakSelf.queue.suspended = YES;
            [weakSelf show:^{
                NSLog(@"任务%ld完成",(long)weakSelf.index);
                weakSelf.index++;
                weakSelf.queue.suspended = NO;
            }];
        }];
    });
    NSArray *arr = _queue.operations;
    NSLog(@"%@",arr);
}

- (void)clickPause {
    _queue.suspended = !_queue.suspended;
    if (_queue.suspended) {
        NSLog(@"暂停");
    }else{
        NSLog(@"继续");
    }
}

- (void)show:(void(^)(void))closeBlock {
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"测试一哈" preferredStyle:UIAlertControllerStyleAlert];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    });
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"关闭" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alert dismissViewControllerAnimated:YES completion:nil];
        closeBlock();
    }];
    [alert addAction:cancel];

}
@end
