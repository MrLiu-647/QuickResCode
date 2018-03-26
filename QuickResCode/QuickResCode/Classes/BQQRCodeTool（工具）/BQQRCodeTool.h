//
//  BQQRCodeTool.h
//  QuickResCode
//
//  Created by 刘思齐 on 2018/3/14.
//  Copyright © 2018年 刘思齐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface BQQRCodeTool : NSObject
//single_interface(BQQRCodeTool)

// 设置是否需要二维码边框
@property (nonatomic, assign) BOOL isDrawQRCodeRect;

// 开始扫描
- (void)beginScanInView:(UIView *)view result:(void(^)(NSArray<NSString *> *resultStrs))resultBlock;

// 停止扫描
- (void)stopScan;

// 设置兴趣点
- (void)setInsteretRect:(CGRect)originRect;

@end
