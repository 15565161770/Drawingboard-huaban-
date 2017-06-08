
//
//  ColorPicker.m
//  CaplessCoderPaint
//
//  Created by crossmo/yangcun on 14/10/29.
//  Copyright (c) 2014年 yangcun. All rights reserved.
//

#import "ColorPicker.h"

@implementation ColorPicker
@synthesize delegate;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

// 通过手势去完成代理操作
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([delegate respondsToSelector:@selector(aColorPickerIsSelected:)]) {
        [delegate aColorPickerIsSelected:[self backgroundColor]];
    }
    self.layer.borderWidth = 1.0f;
    self.layer.borderColor = [[UIColor redColor] CGColor];
}

@end
