//
//  TouchDrawView.h
//  CaplessCoderPaint
//
//  Created by crossmo/yangcun on 14/10/29.
//  Copyright (c) 2014年 yangcun. All rights reserved.
// 画板内容类

#import <UIKit/UIKit.h>
#import "Line.h"

@interface TouchDrawView : UIView {
    BOOL isCleared;
}

// 当前线条
@property (nonatomic) Line *currentLine;
//  存放线条的数组
@property (nonatomic) NSMutableArray *linesCompleted;
// 画笔颜色
@property (nonatomic) UIColor *drawColor;

// 后撤笔画
- (void)undo;
// 前进笔画
- (void)redo;
@end
