//
//  CALayer+XibBorderColor.m
//  QuickResCode
//
//  Created by 刘思齐 on 2018/3/13.
//  Copyright © 2018年 刘思齐. All rights reserved.
//

#import "CALayer+XibBorderColor.h"

@implementation CALayer (XibBorderColor)

- (void)setBorderColorWithUIColor:(UIColor *)color
{
    self.borderColor = color.CGColor;
}

@end
