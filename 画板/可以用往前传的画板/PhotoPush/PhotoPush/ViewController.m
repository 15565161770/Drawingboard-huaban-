//
//  ViewController.m
//  PhotoPush
//
//  Created by admin on 16/7/20.
//  Copyright © 2016年 cn.docqian. All rights reserved.
//   图片上传

#import "ViewController.h"

#import "PJRSignatureView.h"
#import "BNFFaxSigntureView.h"
#import "DrawController.h"
#import "PushController.h"

@interface ViewController ()

@property (nonatomic, strong)PJRSignatureView *signatureView;
@property (nonatomic, strong)BNFFaxSigntureView *bnv;


@property (nonatomic, strong)UIBezierPath *bezierPath;
@property (nonatomic)CGRect sianalFrame;
@property (nonatomic, strong)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [[UIButton alloc]init];
    button.frame = CGRectMake(100, 100, 100, 30);
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
    
}


-(void)pop {
    PushController *push = [[PushController alloc]init];
    [self.navigationController pushViewController:push animated:YES];
}

//是否可以旋转
- (BOOL)shouldAutorotate
{
    return false;
}
//支持的方向
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

@end
