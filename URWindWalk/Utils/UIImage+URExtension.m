//
//  UIImage+URExtension.m
//  URWindWalk
//
//  Created by weiyan on 23/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import "UIImage+URExtension.h"

NSString * JPGExtension = @"jpg";
NSString * PNGExtension = @"png";

@implementation UIImage(URExtension)

- (UIImage *)ur_imageWithRoundedSize:(CGSize)sizeToFit
{
    CGRect rect = (CGRect){0.f, 0.f, sizeToFit};
    
    UIGraphicsBeginImageContextWithOptions(sizeToFit, NO, UIScreen.mainScreen.scale);
    CGContextAddPath(UIGraphicsGetCurrentContext(),
                     [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:sizeToFit.width].CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    
    [self drawInRect:rect];
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return output;
}

- (UIImage *)ur_imageWithRoundCornerRadius:(CGSize)sizeToFit
                              cornerRadius:(CGFloat)cornerRadius
{
    CGRect rect = (CGRect){0.f, 0.f, sizeToFit.width, sizeToFit.height};
    
    CGFloat scale = [UIScreen mainScreen].scale;
    // 防止圆角半径小于0，或者大于宽/高中较小值的一半。
    if (cornerRadius < 0) {
        cornerRadius = 0;
    }
    else if (cornerRadius > MIN(sizeToFit.width, sizeToFit.height)) {
        cornerRadius = MIN(sizeToFit.width, sizeToFit.height) / 2.;
    }
    
    UIImage *image = nil;
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, scale);
    [[UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:cornerRadius] addClip];
    [self drawInRect:rect];
    image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)ur_getLocalImageForResouce:(NSString *)imageName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"jpg"];
    
    if(path.length == 0) {
        path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"];
    }
    
    if (path.length == 0) {
        return nil;
    }
    
    return  [UIImage imageWithContentsOfFile:path];
}

@end
