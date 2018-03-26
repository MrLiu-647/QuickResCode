//
//  BQCreateViewController.m
//  QuickResCode
//
//  Created by 刘思齐 on 2018/3/13.
//  Copyright © 2018年 刘思齐. All rights reserved.
//

#import "BQCreateViewController.h"
#import "BQButton.h"
#import <Masonry.h>
#import <SVProgressHUD.h>

@interface BQCreateViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet BQButton *uploadLogoBtn;

@end

@implementation BQCreateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

// 退出编辑模式
- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    if (![self.textField isExclusiveTouch]) {
        BQFunc()
        [self.textField resignFirstResponder];
    }
}

#pragma mark - 按钮的点击事件

// 上传Logo按钮点击
- (IBAction)uploadLogoBtnOnClick:(id)sender {
    UIImagePickerController *pickerVc = [[UIImagePickerController alloc] init];
    pickerVc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    pickerVc.delegate = self;
    [self presentViewController:pickerVc animated:YES completion:^{
        
    }];
}

// 创建二维码按钮点击
- (IBAction)createQRCodeBtnOnClick:(id)sender {
    BQFunc();
}

// 清除内容按钮点击
- (IBAction)clearContentBtnOnClick:(id)sender {
    BQFunc();
    self.textField.text = nil;
    [self.uploadLogoBtn setBackgroundImage:nil forState:UIControlStateNormal];
    [self.uploadLogoBtn setTitle:@"上传LOGO" forState:UIControlStateNormal];
    [SVProgressHUD showSuccessWithStatus:@"清除成功！"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [SVProgressHUD dismiss];
    });
}

#pragma mark - UIImagePickerControllerDelegate
// 选择相片的代理方法
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    BQFunc();
    [picker dismissViewControllerAnimated:YES completion:nil];
    [self.uploadLogoBtn setBackgroundImage:info[UIImagePickerControllerOriginalImage] forState:UIControlStateNormal];
    [self.uploadLogoBtn setTitle:@"" forState:UIControlStateNormal];
}


- (void)dealloc {
    [SVProgressHUD dismiss];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
