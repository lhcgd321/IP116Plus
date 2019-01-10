//
//  LHScreenSize.h
//  116
//
//  Created by kd on 2019/1/3.
//  Copyright © 2019 ipc. All rights reserved.
//

#ifndef LHScreenSize_h
#define LHScreenSize_h
//APP Frame
#define Application_Frame [UIApplication sharedApplication].keyWindow.rootViewController.view.bounds

//屏幕宽高
#define APP_Frame_Height (Application_Frame.size.height)
#define APP_Frame_Width  (Application_Frame.size.width)

//转屏时使用(满屏宽，满屏高）
#define kFullWidth  MIN(APP_Frame_Width, APP_Frame_Height)        // 取小的值
#define kFullHeight MAX(APP_Frame_Width, APP_Frame_Height)        // 取大的值

//base on iphone5
#define kHeightFactor (kFullHeight/568.0)
#define kWidthFactor (kFullWidth/320.0)



#endif /* LHScreenSize_h */

