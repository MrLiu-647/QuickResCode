//
//  BQTabBarController.m
//  QuickResCode
//
//  Created by 刘思齐 on 2018/3/13.
//  Copyright © 2018年 刘思齐. All rights reserved.
//

#import "BQTabBarController.h"
#import "BQTabBar.h"

#import "BQCreateViewController.h"
#import "BQSpotViewController.h"
#import "BQScanViewController.h"
#import "BQEncryptViewController.h"
#import "BQSettingViewController.h"


@interface BQTabBarController ()

@end

@implementation BQTabBarController

// 只会调用一次
+ (void) load{
    /*
     appearance :
     注意：
     1. 只要遵循了UIAppearance协议，还要实现这个方法
     2. 那些属性可以通过appearance设置，只有被UI_APPEARENCE_SELECTOR宏修饰的属性，才能设置
     */
    
    // 获取整个应用下的UITabBarItem
    //    UITabBarItem *item = [UITabBarItem appearance];
    // 获取当前类的UITabBarItem
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    
    // 设置按钮选中标题的颜色：富文本：描述一个文字颜色、字体、阴影、空心、图文混排
    // 创建一个描述文本属性的字典
    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
    attrs[NSForegroundColorAttributeName] = [UIColor blackColor];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
    
    // 设置字体尺寸：只有在正常状态下才会有用
    NSMutableDictionary *attrsNor = [NSMutableDictionary dictionary];
    attrsNor[NSFontAttributeName] = [UIFont systemFontOfSize:13];
    [item setTitleTextAttributes:attrsNor forState:UIControlStateNormal];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupAllChildViewControllers];    // 1.添加子控制器
    
    [self setUpAllTitleButton];     // 2.设置tabBar按钮内容
    
    [self setUpTabBar];     // 3.自定义tabBar
}

#pragma mark - 设置子控制器
- (void)setupAllChildViewControllers {
    // 1.制作
    BQCreateViewController *createVc = [[BQCreateViewController alloc] init];
    [self addChildViewController:createVc];
    
    // 2.识别
    BQSpotViewController *spotVc = [[BQSpotViewController alloc] init];
    [self addChildViewController:spotVc];
    
    // 3.扫描
    
    // 4.加密
    BQEncryptViewController *EncryptVc = [[BQEncryptViewController alloc] init];
    [self addChildViewController:EncryptVc];
    
    // 5.设置
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:NSStringFromClass([BQSettingViewController class]) bundle:nil];
    BQSettingViewController *settingVc = [storyboard instantiateInitialViewController];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:settingVc];
    [self addChildViewController:nav];
}

#pragma mark - 设置按钮标题
- (void) setUpAllTitleButton{
    // 0.制作
    BQCreateViewController *createVc = self.childViewControllers[0];
    createVc.tabBarItem.title = @"制作";
    createVc.tabBarItem.image = [UIImage imageNamed:@"create"];
    createVc.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"create_selected"];

    
    // 1.识别
    BQSpotViewController *spotVc = self.childViewControllers[1];
    spotVc.tabBarItem.title = @"识别";
    spotVc.tabBarItem.image = [UIImage imageNamed:@"spot"];
    spotVc.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"spot_selected"];
    
    // 2.扫描
    
    // 3.加密
    BQEncryptViewController *encryptVc = self.childViewControllers[2];
    encryptVc.tabBarItem.title = @"加密";
    encryptVc.tabBarItem.image = [UIImage imageNamed:@"encrypt"];
    encryptVc.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"encrypt_selected"];
    
    // 4.设置
    BQSettingViewController *settingVc = self.childViewControllers[3];
    settingVc.tabBarItem.title = @"设置";
    settingVc.tabBarItem.image = [UIImage imageNamed:@"setting"];
    settingVc.tabBarItem.selectedImage = [UIImage imageOriginalWithName:@"setting_selected"];
}

#pragma mark - 自定义tabBar
- (void) setUpTabBar {
    BQTabBar *tabBar = [[BQTabBar alloc] init];
    [self setValue:tabBar forKey:@"tabBar"];
    [tabBar.scanButton addTarget:self action:@selector(scanBtnOnClick) forControlEvents:UIControlEventTouchUpInside];
}

- (void)scanBtnOnClick {
    BQFunc();
    NSLog(@"123");
    BQScanViewController *scanVc = [[BQScanViewController alloc] init];
    [self presentViewController:scanVc animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
