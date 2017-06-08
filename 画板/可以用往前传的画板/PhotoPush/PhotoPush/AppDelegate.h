//
//  AppDelegate.h
//  PhotoPush
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 cn.docqian. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FangXiangNavigationViewController.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic,strong)FangXiangNavigationViewController *fangXiang;
@property (assign, nonatomic) NSInteger allowRotation;

@property float autoSizeScaleX;
@property float autoSizeScaleY;
@end

