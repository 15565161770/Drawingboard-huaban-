//
//  BNFFaxSigntureView.m
//  BnetFax
//
//  Created by 吴青 on 16/2/1.
//  Copyright © 2016年 hzdracom. All rights reserved.
//

#import "BNFFaxSigntureView.h"


@implementation BNFFaxSigntureView {
    UIImage *incrImage;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    UIColor *strokeColor = [UIColor redColor];
    [strokeColor set];
    
    self.path.lineWidth = 2.0;
    [self.path applyTransform:(CGAffineTransformMakeScale(self.scaleW,
                                                          self.scaleH))];
        [self.path stroke];
}
- (void)drawBitmapImage:(UIBezierPath*)path bounds:(CGRect)bounds
{
    UIGraphicsBeginImageContextWithOptions(bounds.size,
                                           YES,
                                           0.0);
    
    UIBezierPath *rectpath = [UIBezierPath bezierPathWithRect:bounds];
    [[UIColor whiteColor] setFill];
    [rectpath fill];
    [incrImage drawAtPoint:CGPointZero];
    
    //Set final color for drawing
    UIColor *strokeColor = [UIColor blackColor];
    [strokeColor setStroke];
    [path stroke];
    
    incrImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
}
- (UIImage *)getSignatureImage {
    UIGraphicsBeginImageContextWithOptions(self.bounds.size,
                                           NO,
                                           [UIScreen mainScreen].scale);
    
    [self drawViewHierarchyInRect:self.bounds afterScreenUpdates:YES];
    
    UIImage *signatureImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return signatureImage;
}

@end
