//
//  UIImage+URExtension.h
//  URWindWalk
//
//  Created by weiyan on 23/12/2016.
//  Copyright © 2016 weiyan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage(URExtension)

- (UIImage *)ur_imageWithRoundedSize:(CGSize)sizeToFit;

- (UIImage *)ur_imageWithRoundCornerRadius:(CGSize)sizeToFit
                              cornerRadius:(CGFloat)cornerRadius;

+ (UIImage *)ur_getLocalImageForResouce:(NSString *)imageName;

@end
