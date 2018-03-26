//
//  BQButton.m
//  QuickResCode
//
//  Created by 刘思齐 on 2018/3/13.
//  Copyright © 2018年 刘思齐. All rights reserved.
//

#import "BQButton.h"

@implementation BQButton

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.layer.borderColor = [UIColor whiteColor].CGColor;
        self.layer.borderWidth = 1;
        self.layer.masksToBounds = YES;
        self.layer.cornerRadius = 10;
    }
    return self;
}

@end
