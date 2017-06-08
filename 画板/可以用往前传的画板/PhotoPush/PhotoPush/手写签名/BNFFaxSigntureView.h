//
//  BNFFaxSigntureView.h
//  BnetFax
//
//  Created by 吴青 on 16/2/1.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BNFFaxSigntureView : UIView
@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, assign) CGFloat scaleW;
@property (nonatomic, assign) CGFloat scaleH;
@property (nonatomic, assign) BOOL pan;

- (UIImage *)getSignatureImage;
- (void)drawBitmapImage:(UIBezierPath*)path bounds:(CGRect)bounds;
@end
