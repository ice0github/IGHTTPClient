//
//  ToolMacro.h
//
//  Created by Gavin He on 13-9-11.
//  Copyright (c) 2013年 Gavin He. All rights reserved.
//


#define IS_IPAD UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad

// Log
#ifndef __OPTIMIZE__
#define IGLog(...) NSLog(__VA_ARGS__)
#else
#define IGLog(...) {}
#endif

#define IGLogFunction IGLog(@"%s", __FUNCTION__);

// 版本
#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

// 语言环境
#define LANGUAGE_CURRENT ([[NSLocale preferredLanguages] objectAtIndex:0])

// 设备屏幕大小
#define SCREEN_SIZE [[UIScreen mainScreen] bounds].size

// 常量
#define VIEW_HEIGHT_NAV       44.0
#define VIEW_HEIGHT_STATUS    20.0
#define VIEW_HEIGHT_TABBAR    44.0

//检测设备朝向是否竖屏
#define checkOrientationIsPortrait(interfaceOrientation) UIInterfaceOrientationIsPortrait(self.interfaceOrientation)

// 读取资源文件中的图片，不带缓存的
#define loadImage(file,ext) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:ext]]
#define loadPngImage(file) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:@"png"]]
#define loadJpgImage(file) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:file ofType:@"jpg"]]

// 读取图片，带缓存的
#define IGImageNamed(file) [UIImage imageNamed:file]

//判断对象是否为空，并输出到控制台
#define IGObjectIsExistAndObjectName(obj,msg) NSLog(@"%@ is exist? %@",msg,obj?@"YES":@"NO")
#define IGObjectIsExist(obj) NSObjectIsExistAndObjectName(obj,@"object")


// 获取本地话String
#define IGLocalizedString(str) NSLocalizedString(str,str)


// app 版本检测
// use to check/update app version from appstore
/*
#define AppStore_App_ID @""
#define AppStore_App_Name @""
#define AppStore_URL     [NSString stringWithFormat:@"itms://itunes.apple.com/cn/app/%@/id%@?mt=8",AppStore_App_Name,AppStore_App_ID]
#define AppStore_CheckVersion_URL [NSString stringWithFormat:@"http://itunes.apple.com/lookup?id=%@",AppStore_App_ID]
#define AppStore_Rating_URL [NSString stringWithFormat:@"itms-apps://ax.itunes.apple.com/WebObjects/MZStore.woa/wa/viewContentsUserReviews?type=Purple+Software&id=%@",AppStore_App_ID]
*/