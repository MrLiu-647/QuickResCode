//
//  BQResultViewController.m
//  QuickResCode
//
//  Created by 刘思齐 on 2018/3/15.
//  Copyright © 2018年 刘思齐. All rights reserved.
//

#import "BQResultViewController.h"
#import <SVProgressHUD.h>

@interface BQResultViewController ()

@property (strong, nonatomic) IBOutlet UITextView *TextView;

@end

@implementation BQResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _TextView.text = self.text;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// 复制链接
- (IBAction)copyLinkBtnOnClick:(id)sender {
    [SVProgressHUD showSuccessWithStatus:@"复制成功！"];
    
    UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];    //复制文本到剪切板
    pasteboard.string = [self.TextView.text substringFromIndex:6];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

- (IBAction)backBtnOnClick:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
