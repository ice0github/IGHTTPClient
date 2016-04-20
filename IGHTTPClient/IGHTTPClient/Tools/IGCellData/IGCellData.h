//
//  IGCellData.h
//  Dagongzai
//
//  Created by 何桂强 on 14-10-9.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//
//
//-(IGCellData*)cellDataForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (tableDatas &&
//        tableDatas.count > indexPath.section ) {
//        NSObject *subDatas = tableDatas[indexPath.section];
//        if (subDatas) {
//            if ([subDatas isKindOfClass:[NSArray class]] && [(NSArray*)subDatas count] > indexPath.row) {
//                NSObject *data = [(NSArray*)subDatas objectAtIndex:indexPath.row];
//                if (data && [data isKindOfClass:[IGCellData class]]) {
//                    return (IGCellData*)data;
//                }
//            }else if ([subDatas isKindOfClass:[IGCellData class]]) {
//                return (IGCellData*)subDatas;
//            }
//        }
//    }
//    return nil;
//}

#import <UIKit/UIKit.h>

@interface IGCellData : NSObject
@property (nonatomic,assign) int type;
@property (nonatomic,strong) UIImage *icon;
@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *subTitle;
@property (nonatomic,strong) NSObject *value;
@property (nonatomic,strong) NSString *desc;

+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle;
+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle vaule:(NSObject*)avalue;

+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle subTitle:(NSString*)asubtitle;
+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle subTitle:(NSString*)asubtitle vaule:(NSObject*)avalue;

+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle icon:(UIImage*)aicon;
+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle icon:(UIImage*)aicon vaule:(NSObject*)avalue;

+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle icon:(UIImage*)aicon subTitle:(NSString*)asubtitle;
+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle icon:(UIImage*)aicon subTitle:(NSString*)asubtitle vaule:(NSObject*)avalue;

+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle icon:(UIImage*)aicon subTitle:(NSString*)asubtitle desc:(NSString*)aDesc vaule:(NSObject*)avalue;

@end
