//
//  UIView+ScreenShot.h
//  wangliIntelligence
//
//  Created by apple on 2017/3/29.
//  Copyright © 2017年 weidong. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (ScreenShot)

/**
 截图

 @param rect 截图区域
 @return 目标image
 */
- (UIImage *)screenshotWithRect:(CGRect)rect;
@end
