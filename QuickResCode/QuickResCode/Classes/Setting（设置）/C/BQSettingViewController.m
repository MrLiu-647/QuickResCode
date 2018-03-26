//
//  BQSettingViewController.m
//  QuickResCode
//
//  Created by 刘思齐 on 2018/3/13.
//  Copyright © 2018年 刘思齐. All rights reserved.
//

/*
 一、从相册里面选择图片到App中
 1.选择单张图片
 1> UIImagePickerController (自带选择界面)
 2> AssetsLibrary框架 (选择界面需要开发者自己搭建)
 3> Photos框架 (选择界面需要开发者自己搭建)
 
 2.选择多张图片(图片数量 >= 2)
 1> AssetsLibrary框架 (选择界面需要开发者自己搭建)
 2> Photos框架 (选择界面需要开发者自己搭建)
 
 二、利用照相机拍一张照片到App
 1> UIImagePickerController (自带选择界面)
 2> AVCapture****，比如AVCaptureSeession
 */

#import "BQSettingViewController.h"
#import <SVProgressHUD.h>

@interface BQSettingViewController ()

@property (nonatomic, strong) UIAlertController *alertVc;

@end

@implementation BQSettingViewController

- (UIAlertController *)alertVc{
    if (_alertVc == nil) {
        _alertVc = [UIAlertController alertControllerWithTitle:@"问题反馈" message:@"如果您有任何问题，欢迎发送至liusiqi1129@foxmail.com。我会第一时间解决您的问题。" preferredStyle:UIAlertControllerStyleAlert];
        [_alertVc addAction:[UIAlertAction actionWithTitle:@"知道了" style:UIAlertActionStyleDefault handler:nil]];
    }
    return _alertVc;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigationbarBackgroundWhite"] forBarMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    BQLog(@"%@",indexPath);
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self sweepCodeSound];  // 扫码音效
        } else if (indexPath.row == 1){
            [self sweepCodeVibration];  // 扫码震动
        }
    } else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            [self historyRecord];   // 历史记录
        } else if (indexPath.row == 1){
            [self clearRecored];    // 清除记录
        }
    } else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            [self EvaluativeFeedback];  // 评价反馈
        }
    }
}

// 扫码音效
- (void)sweepCodeSound{
    
}

// 扫码震动
- (void)sweepCodeVibration{
    
}

// 历史记录
- (void)historyRecord {
    
}

// 清除记录
- (void)clearRecored {
    // ...
    [SVProgressHUD showSuccessWithStatus:@"清除成功！"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

// 评价反馈
- (void)EvaluativeFeedback{
    [self presentViewController:self.alertVc animated:YES completion:nil];
}

- (void)dealloc {
    [SVProgressHUD dismiss];
}

@end
