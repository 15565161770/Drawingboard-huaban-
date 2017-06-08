//
//  Line.m
//  CaplessCoderPaint
//
//  Created by crossmo/yangcun on 14/10/29.
//  Copyright (c) 2014年 yangcun. All rights reserved.
//

#import "Line.h"

@implementation Line

@synthesize begin, end, color;

// 线默认为黑色
- (id)init
{
    self = [super init];
    if (self) {
        [self setColor:[UIColor blackColor]];
    }
    return self;
}

@end
