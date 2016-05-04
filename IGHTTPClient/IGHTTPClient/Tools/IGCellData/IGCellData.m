//
//  IGCellData.m
//  Dagongzai
//
//  Created by 何桂强 on 14-10-9.
//  Copyright (c) 2014年 Pactera. All rights reserved.
//

#import "IGCellData.h"

@implementation IGCellData
@synthesize type,icon,subTitle,title,value,desc;

#pragma mark - 构造方法
+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle{
    return [IGCellData dataWithType:type andTitle:atitle icon:nil subTitle:nil desc:nil vaule:nil];
}
+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle vaule:(NSObject*)avalue{
    return [IGCellData dataWithType:type andTitle:atitle icon:nil subTitle:nil desc:nil vaule:avalue];
}

+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle subTitle:(NSString*)asubtitle{
    return [IGCellData dataWithType:type andTitle:atitle icon:nil subTitle:asubtitle desc:nil vaule:nil];
}
+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle subTitle:(NSString*)asubtitle vaule:(NSObject*)avalue{
    return [IGCellData dataWithType:type andTitle:atitle icon:nil subTitle:asubtitle desc:nil vaule:avalue];
}

+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle icon:(UIImage*)aicon{
    return [IGCellData dataWithType:type andTitle:atitle icon:aicon subTitle:nil desc:nil vaule:nil];
}
+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle icon:(UIImage*)aicon vaule:(NSObject*)avalue{
    return [IGCellData dataWithType:type andTitle:atitle icon:aicon subTitle:nil desc:nil vaule:avalue];
}

+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle icon:(UIImage*)aicon subTitle:(NSString*)asubtitle{
    return [IGCellData dataWithType:type andTitle:atitle icon:aicon subTitle:asubtitle desc:nil vaule:nil];
}
+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle icon:(UIImage*)aicon subTitle:(NSString*)asubtitle vaule:(NSObject*)avalue{
    return [IGCellData dataWithType:type andTitle:atitle icon:aicon subTitle:asubtitle desc:nil vaule:avalue];
}

+(instancetype)dataWithType:(int)type andTitle:(NSString*)atitle icon:(UIImage*)aicon subTitle:(NSString*)asubtitle desc:(NSString*)aDesc vaule:(NSObject*)avalue{
    IGCellData *option = [[IGCellData alloc] init];
    option.type        = type;
    option.title       = atitle;
    option.icon        = aicon;
    option.subTitle    = asubtitle;
    option.value       = avalue;
    option.desc        = aDesc;
    return option;
}

-(NSString *)description{
    return [NSString stringWithFormat:@"\n type -> %d \n title -> %@ \n subTitle -> %@ \n icon -> %@ \n value -> %@ \n desc -> %@\n",type,title,subTitle,icon,value,desc];
}
@end
