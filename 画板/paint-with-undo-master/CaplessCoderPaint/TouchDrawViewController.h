//
//  TouchDrawViewController.h
//  CaplessCoderPaint
//
//  Created by crossmo/yangcun on 14/10/29.
//  Copyright (c) 2014年 yangcun. All rights reserved.
//

#import <UIKit/UIKit.h>
// 颜色选择类
#import "ColorPicker.h"
// 画版类
#import "TouchDrawView.h"

@interface TouchDrawViewController : UIViewController <ColorPickerDelegate>
{
    // 判断是否清除
    BOOL isCleared;
    // 判断是否选择颜色
    BOOL isSelectedColor;
}
//  选择颜色按钮
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector1;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector2;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector3;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector4;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector5;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector6;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector7;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector8;
@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector9;
@property (retain, nonatomic) IBOutlet TouchDrawView *drewArea; // 画板内容区域

@property (unsafe_unretained, nonatomic) IBOutlet ColorPicker *selector0;
@property (weak, nonatomic) IBOutlet UIButton *undoButton; //返回 按钮
@property (weak, nonatomic) IBOutlet UIButton *redoButton; //前进 按钮

- (IBAction)undo:(id)sender; //  返回方法

- (IBAction)redo:(id)sender; // 前进方法

@end
