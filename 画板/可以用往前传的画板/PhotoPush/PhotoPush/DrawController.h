//
//  DrawController.h
//  PhotoPush
//
//  Created by admin on 16/7/21.
//  Copyright © 2016年 cn.docqian. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ReturenBezierBlock)(UIBezierPath* path);
typedef void(^ReturnFrameBlock)(CGRect frame);

@interface DrawController : UIViewController

@property (nonatomic, copy)ReturenBezierBlock returenBezierBlock;
@property (nonatomic, copy)ReturnFrameBlock returnFrameBlock;

//@property(nonatomic, copy) void (^ReturenBezierBlock)(UIBezierPath* path);
//@property(nonatomic, copy) void (^ReturnFrameBlock)(CGRect frame);

//typedef void (^ReturnFrameBlock)(CGRect frame);
//typedef void (^ReturenBezierBlock)(UIBezierPath* path);

- (void)returnBezier:(ReturenBezierBlock )block;
- (void)returnFrame:(ReturnFrameBlock )block;

@end
