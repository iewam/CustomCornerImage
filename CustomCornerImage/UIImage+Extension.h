//
//  UIImage+Extension.h
//  CustomCornerImage
//
//  Created by caifeng on 2017/2/22.
//  Copyright © 2017年 facaishu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)


/**
 渲染一张纯色图片

 @param renderColor <#renderColor description#>
 @return <#return value description#>
 */
+ (UIImage *)mw_renderImageFormColor:(UIColor *)renderColor;

/**
 异步绘制圆角图片

 @param size imageView的size
 @param fillColor 剪切部分填充颜色
 @param completion 异步绘制通过block返回绘制结果
 */
- (void)mw_cornerImageWithSize:(CGSize)size fillColor:(UIColor *)fillColor completion:(void(^)(UIImage *image))completion;

@end
