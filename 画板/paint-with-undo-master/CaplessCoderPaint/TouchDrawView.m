//
//  TouchDrawView.m
//  CaplessCoderPaint
//
//  Created by crossmo/yangcun on 14/10/29.
//  Copyright (c) 2014年 yangcun. All rights reserved.
//

#import "TouchDrawView.h"
#import "Common.h"

@implementation TouchDrawView
{
    // 是否被  橡皮擦  擦出
    BOOL _isEraser;
}
@synthesize currentLine;
@synthesize linesCompleted;
@synthesize drawColor;

- (id)initWithCoder:(NSCoder *)c
{
    self = [super initWithCoder:c];
    if (self) {
        // 初始化线条数组
        linesCompleted = [[NSMutableArray alloc] init];
        [self setMultipleTouchEnabled:YES];
        // 画笔默认颜色
        drawColor = [UIColor blackColor];
        // 获取第一响应者
        [self becomeFirstResponder];
    }
    return self;
}

//  It is a method of UIView called every time the screen needs a redisplay or refresh.
- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 5.0);
    CGContextSetLineCap(context, kCGLineCapRound);
    for (Line *line in linesCompleted) {
        [[line color] set];
        CGContextMoveToPoint(context, [line begin].x, [line begin].y);
        CGContextAddLineToPoint(context, [line end].x, [line end].y);
        CGContextStrokePath(context);
    }

}


// 回撤或者前进功能
- (void)undo
{
    if ([self.undoManager canUndo]) {
        [self.undoManager undo];
    }
    NSLog(@"----回撤---undo----");
}

- (void)redo
{
    if ([self.undoManager canRedo]) {
        [self.undoManager redo];
    }
    NSLog(@"----前进---redo----");

}


/*
   开始触摸
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.undoManager beginUndoGrouping];
    NSLog(@"-------touchesBegan");
    for (UITouch *t in touches) {
        // Create a line for the value
        CGPoint loc = [t locationInView:self];
        Line *newLine = [[Line alloc] init];
        // 绘制线的开始
        [newLine setBegin:loc];
        // 绘制线的结束
        [newLine setEnd:loc];
        // 设置线的颜色
        [newLine setColor:drawColor];
        currentLine = newLine;
    }
}

// 将划出的line添加到数组里面
- (void)addLine:(Line*)line
{
    [[self.undoManager prepareWithInvocationTarget:self] removeLine:line];
    [linesCompleted addObject:line];
    [self setNeedsDisplay];
}

- (void)removeLine:(Line*)line
{
    if ([linesCompleted containsObject:line]) {
        [[self.undoManager prepareWithInvocationTarget:self] addLine:line];
        [linesCompleted removeObject:line];
        [self setNeedsDisplay];
    }
}

- (void)removeLineByEndPoint:(CGPoint)point
{
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        Line *evaluatedLine = (Line*)evaluatedObject;
//        return (evaluatedLine.end.x == point.x && evaluatedLine.end.y == point.y) ||
//               (evaluatedLine.end.x == point.x - 1.0f && evaluatedLine.end.y == point.y - 1.0f) ||
//               (evaluatedLine.end.x == point.x + 1.0f && evaluatedLine.end.y == point.y + 1.0f);
        return (evaluatedLine.end.x <= point.x-1 || evaluatedLine.end.x > point.x+1) &&
               (evaluatedLine.end.y <= point.y-1 || evaluatedLine.end.y > point.y+1);
    }];
    NSArray *result = [linesCompleted filteredArrayUsingPredicate:predicate];
    if (result && result.count > 0) {
        [linesCompleted removeObject:result[0]];
    }
}


- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"----touchesMoved");
    if (!isCleared) {
        for (UITouch *t in touches) {
            [currentLine setColor:drawColor];
            CGPoint loc = [t locationInView:self];
            [currentLine setEnd:loc];
            
            if (currentLine) {
                if ([Common color:drawColor isEqualToColor:[UIColor clearColor] withTolerance:0.2]) {
                    // eraser
                    // [self removeLineByEndPoint:loc]; //this solution can not work.
                    _isEraser = YES;
                } else {
                    _isEraser = NO;
                    [self addLine:currentLine];
                }
            }
            Line *newLine = [[Line alloc] init];
            [newLine setBegin:loc];
            [newLine setEnd:loc];
            [newLine setColor:drawColor];
            currentLine = newLine;
        }
    }
}

- (void)endTouches:(NSSet *)touches
{
    NSLog(@"-----endTouches");
    if (!isCleared) {
        [self setNeedsDisplay];
    } else {
        isCleared = NO;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"-----touchesEnded");
    [self endTouches:touches];
    [self.undoManager endUndoGrouping];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"-----touchesCancelled");
    [self endTouches:touches];
}

// 成为第一相应者
- (BOOL)canBecomeFirstResponder
{
    return YES;
}

// 已经离开窗口
- (void)didMoveToWindow
{
    [self becomeFirstResponder];
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

@end
