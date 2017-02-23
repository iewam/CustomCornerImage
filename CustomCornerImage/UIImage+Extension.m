//
//  UIImage+Extension.m
//  CustomCornerImage
//
//  Created by caifeng on 2017/2/22.
//  Copyright © 2017年 facaishu. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+ (UIImage *)mw_renderImageFormColor:(UIColor *)renderColor {

    CFTimeInterval start = CACurrentMediaTime();
    
    CGRect rect = CGRectMake(0, 0, 300.0, 300.0);
    UIGraphicsBeginImageContext(rect.size);
    [renderColor setFill];
    UIRectFill(rect);
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSLog(@"render time-%f", CACurrentMediaTime() - start);
    
    return result;
}

- (void)mw_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void (^)(UIImage *))completion {

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        CFTimeInterval start = CACurrentMediaTime();
        
        UIGraphicsBeginImageContextWithOptions(size, YES, 0);
        CGRect rect = CGRectMake(0, 0, size.width, size.height);
        
        [fillColor setFill];
        UIRectFill(rect);
        
        UIBezierPath *clipPath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:rect.size.width * 0.5];
        [clipPath addClip];
        
        [self drawInRect:rect];
        UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        NSLog(@"corner time-%f", CACurrentMediaTime() - start);
        
            dispatch_async(dispatch_get_main_queue(), ^{
              
                if (completion != nil) {
                   
                    completion(result);
                }
            });
        
    });
}



@end
