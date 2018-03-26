//
//  BQAdViewController.m
//  QuickResCode
//
//  Created by 刘思齐 on 2018/3/13.
//  Copyright © 2018年 刘思齐. All rights reserved.
//

#import "BQAdViewController.h"
#import "BQTabBarController.h"

@interface BQAdViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *launchImageView;  // 启动图片
@property (weak, nonatomic) IBOutlet UIButton *jumpBtn; //跳转按钮
@property (weak, nonatomic) NSTimer *timer; // 定时器

@end

@implementation BQAdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 1.设置启动图片
    [self setupLaunchImage];
    
    // 2.设置广告数据
    
    // 3.创建定时器
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timeChange) userInfo:nil repeats:YES];
}

// 设置启动图片
- (void)setupLaunchImage {
    self.launchImageView.image = [UIImage imageNamed:@"bg"];
    self.launchImageView.contentMode = UIViewContentModeScaleToFill;
}

// 定时器改变方法
- (void)timeChange {
    static int i = 3;
    i--;
    [self.jumpBtn setTitle:[NSString stringWithFormat:@"跳转（%d）",i] forState:UIControlStateNormal];
    
    if (i == 0) {
        [self jumpClick:nil];
    }
}

// 跳转
- (IBAction)jumpClick:(id)sender {
    BQTabBarController *tabBarVc = [[BQTabBarController alloc] init];
    [UIApplication sharedApplication].keyWindow.rootViewController = tabBarVc;
    
    [self.timer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
