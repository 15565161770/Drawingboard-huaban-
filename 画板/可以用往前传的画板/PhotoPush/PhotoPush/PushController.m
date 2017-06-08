//
//  PushController.m
//  PhotoPush
//
//  Created by Apple on 16/8/23.
//  Copyright © 2016年 cn.docqian. All rights reserved.
//

#import "PushController.h"
#import "PJRSignatureView.h"
#import "BNFFaxSigntureView.h"
#import "DrawController.h"
@interface PushController ()
@property (nonatomic, strong)PJRSignatureView *signatureView;
@property (nonatomic, strong)BNFFaxSigntureView *bnv;
@property (nonatomic, strong)UIBezierPath *bezierPath;
@property (nonatomic)CGRect sianalFrame;
@property (nonatomic, strong)UIImageView *imageView;
@end

@implementation PushController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationItem setTitle:@"方法一"];
    self.view.backgroundColor = [UIColor whiteColor];

//    [self pop];
}

- (void)pop {
    DrawController *draw = [[DrawController alloc]init];
    
    //  path   绘制路径
    [draw returnBezier:^(UIBezierPath *path) {
        
        self.bezierPath = path;
        NSLog(@"%@", path);
        if ([path containsPoint:[path currentPoint]]) {
            [self creatSubView];
            _bnv.path = path;
        }
        
    }];
    //  frame   绘制大小
    [draw returnFrame:^(CGRect frame) {
        
        self.sianalFrame = frame;
        self.bnv.scaleW = self.bnv.frame.size.width / self.sianalFrame.size.width;
        self.bnv.scaleH = self.bnv.frame.size.height / self.sianalFrame.size.height;
        NSLog(@"%f----%f", frame.size.width, frame.size.height);
    }];
    [self.navigationController pushViewController:draw animated:YES];
}

- (void)creatSubView {
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(100, 300, 200, 100)];
    self.imageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:self.imageView];
    
    self.bnv = [[BNFFaxSigntureView alloc]initWithFrame:CGRectMake(0, 0, 100, 80)];
    [self.imageView addSubview:self.bnv];
    self.bnv.center = self.imageView.center;
    CGPoint point = self.imageView.center;
    point.y = point.y - 10;
    self.bnv.center = point;
    self.bnv.backgroundColor = [UIColor clearColor];
    [self.view addSubview:self.bnv];
}


@end
