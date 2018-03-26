//
//  BQTabBar.m
//  QuickResCode
//
//  Created by 刘思齐 on 2018/3/13.
//  Copyright © 2018年 刘思齐. All rights reserved.
//

#import "BQTabBar.h"


@interface BQTabBar()


@end

@implementation BQTabBar

// 懒加载：扫描按钮
- (UIButton *)scanButton{
    if (_scanButton == nil) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setImage:[UIImage imageNamed:@"scan"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"scan_highlighted"] forState:UIControlStateHighlighted];
        [btn sizeToFit];
        [self addSubview:btn];
        
        _scanButton = btn;
    }
    return _scanButton;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.backgroundColor = BQColor(185, 219, 239);
    
    CGFloat btnW = self.bq_width / (self.items.count + 1);
    CGFloat btnH = BQTabBarH;
    CGFloat x = 0;
    int i = 0;

    for (UIControl *tabBarButton in self.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            
            if (i == 2) {
                i++;
            }
            x = i * btnW;
            
            tabBarButton.frame = CGRectMake(x, 0, btnW, btnH);
            
            i++;
        }
    }
    
    // 调整发布按钮位置
    self.scanButton.center = CGPointMake(self.bq_width * 0.5 , BQTabBarH * 0.5);
}


@end
