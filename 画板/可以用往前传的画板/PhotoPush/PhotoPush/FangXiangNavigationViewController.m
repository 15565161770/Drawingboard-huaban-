//
//  FangXiangNavigationViewController.m
//  PhotoPush
//
//  Created by Apple on 16/8/23.
//  Copyright © 2016年 cn.docqian. All rights reserved.
//

#import "FangXiangNavigationViewController.h"

@interface FangXiangNavigationViewController ()

@end

@implementation FangXiangNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate{
    return [self.topViewController shouldAutorotate];
}
//支持的方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != self.orietation);
}

@end
