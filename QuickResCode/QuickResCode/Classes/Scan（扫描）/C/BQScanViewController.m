//
//  BQScanViewController.m
//  QuickResCode
//
//  Created by 刘思齐 on 2018/3/13.
//  Copyright © 2018年 刘思齐. All rights reserved.
//

#import "BQScanViewController.h"
#import "BQQRCodeTool.h"
#import <SafariServices/SafariServices.h>

#import "BQResultViewController.h"


@interface BQScanViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toBottom;
@property (weak, nonatomic) IBOutlet UIView *scanBackView;

@end

@implementation BQScanViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated{

}

- (void)viewDidAppear:(BOOL)animated{
    [self beginScanAnimation];
    [self beginScan];
}

// 开始扫描
- (void)beginScan
{
    BQQRCodeTool *tool = [[BQQRCodeTool alloc] init];
    tool.isDrawQRCodeRect = YES;
    [tool setInsteretRect:self.scanBackView.frame];
    __weak typeof(self) weakSelf = self;
    [tool beginScanInView:self.view result:^(NSArray<NSString *> *resultStrs) {
        __strong typeof(weakSelf) sself = weakSelf;
        NSLog(@"%@", resultStrs.firstObject);
        if (resultStrs != nil) {
            if ([resultStrs.firstObject hasPrefix:@"http"]||[resultStrs.firstObject hasPrefix:@"HTTP"]) {   // 网页直接跳转
                SFSafariViewController *safariVc = [[SFSafariViewController alloc] initWithURL:[NSURL URLWithString:resultStrs.firstObject]];
                [sself presentViewController:safariVc animated:YES completion:nil];
            } else {    // 输出结果
                BQResultViewController *resultVc = [[BQResultViewController alloc] init];
                resultVc.text = [NSString stringWithFormat:@"扫描结果:\n%@",resultStrs.firstObject];;
                [sself presentViewController:resultVc animated:YES completion:nil];
            }
        }
        [tool stopScan];
    }];
}

// 开始扫描动画
- (void)beginScanAnimation
{
    self.toBottom.constant = self.scanBackView.frame.size.height;
    [self.view layoutIfNeeded];
    
    [UIView animateWithDuration:2 animations:^{
        [UIView setAnimationRepeatCount:CGFLOAT_MAX];
        self.toBottom.constant = - self.scanBackView.frame.size.height;
        [self.view layoutIfNeeded];
    }];
}

- (IBAction)cancelScanBtnOnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)dealloc {
    BQLog(@"scan控制器销毁");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
