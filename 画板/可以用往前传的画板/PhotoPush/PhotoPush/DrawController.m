//
//  DrawController.m
//  PhotoPush
//
//  Created by admin on 16/7/21.
//  Copyright © 2016年 cn.docqian. All rights reserved.
//

#import "DrawController.h"
#import "PJRSignatureView.h"
#import "BNFFaxSigntureView.h"
#define ScreenHeight [[UIScreen mainScreen] bounds].size.height
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
@interface DrawController ()
@property (nonatomic, strong)PJRSignatureView *signatureView;
@end

@implementation DrawController

- (void)viewDidLoad {
    [super viewDidLoad];
    

#pragma mark  清除
    UIButton *releaseButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [releaseButton setTitle:@"清除" forState:normal];
    releaseButton.frame = CGRectMake(0, 0, 30, 30);
    [releaseButton addTarget:self action:@selector(cancel:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *releaseButtonItem = [[UIBarButtonItem alloc] initWithCustomView:releaseButton];
    self.navigationItem.leftBarButtonItem = releaseButtonItem;
    
#pragma mark 保存
    UIButton *saveButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [saveButton setTitle:@"发布" forState:normal];
    saveButton.frame = CGRectMake(0, 0, 30, 30);
    [saveButton addTarget:self action:@selector(save:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *saveButtonItem = [[UIBarButtonItem alloc] initWithCustomView:saveButton];
    self.navigationItem.rightBarButtonItem = saveButtonItem;

    [self addPickPhoto];
 
}

- (void)addPickPhoto {
    self.signatureView = [[PJRSignatureView alloc] initWithFrame:CGRectMake(0,
                                                                            0,
                                                                            ScreenWidth,
                                                                            ScreenHeight)];
    [self.view addSubview:self.signatureView];
}

#pragma mark  清除
- (void)cancel:(UIButton*)sender {
    [self.signatureView clearSignature];
}

- (void)save:(UIButton *)save {
    
    [self.navigationController popToRootViewControllerAnimated:YES];
}

#pragma mark  想拿到签名

- (void)returnBezier:(ReturenBezierBlock)block {
    
    self.returenBezierBlock = block;
}
- (void)returnFrame:(ReturnFrameBlock)block {
    self.returnFrameBlock = block;
}

- (void)viewWillDisappear:(BOOL)animated {
    
    [super viewWillDisappear:animated];
    
    if (self.returenBezierBlock != nil) {
        self.returenBezierBlock(self.signatureView.path);
    }
    
    if (self.returnFrameBlock != nil) {
        self.returnFrameBlock(self.signatureView.frame);
    }
    
}

#pragma mark  创建绘制内容
- (void)draw {
    BNFFaxSigntureView *bn = [[BNFFaxSigntureView alloc]init];
    [bn drawBitmapImage:self.signatureView.path bounds:self.signatureView.frame];
    [self.view addSubview:bn];
}




@end
