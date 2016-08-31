//
//  HYRParse.m
//  Dreams
//
//  Created by aiqiyisheng on 16/8/30.
//  Copyright © 2016年 黄永锐. All rights reserved.
//

#import "HYRParse.h"
#import <MJExtension/MJExtension.h>
#import "DreamType.h"
#import "DreamInfo.h"


@implementation HYRParse
//解析 梦的类型
+(NSMutableArray*)parseDreamsTypeWithDic:(NSDictionary *)dict{
    NSMutableArray * array = [NSMutableArray array];
    NSLog(@"解析-请求梦的类型返回的数据:%@",dict);
    NSLog(@"=======%@",dict[@"reason"]);
    NSArray *tempArray = dict[@"result"];
    
    //判断返回的数据是否为空
    if ([tempArray isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    //由于创建的模型层里面属性 和 后台返回的数据名字不一样
    [DreamType mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        //
        return @{
                 //模型层的属性名 : 后台返回的名字
                 @"typeId": @"id",
                 @"typeName": @"name"
                 
                 };
    }];
    
    
    //字典数组 转 模型数组
    array = [DreamType mj_objectArrayWithKeyValuesArray:tempArray];
    
    return array;
}


//根据梦中的事物  解 梦的详情
+(NSMutableArray*)parseDreamDetailInfoWithDic:(NSDictionary *)dict{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:50];
    
    NSArray *tempArray = dict[@"result"];
    
    //判断返回的数据是否为空
    if ([tempArray isKindOfClass:[NSNull class]]) {
        return nil;
    }
    
    //由于创建的模型层里面属性 和 后台返回的数据名字不一样
    [DreamInfo mj_setupReplacedKeyFromPropertyName:^NSDictionary *{
        //
        return @{
                 //模型层的属性名 : 后台返回的名字
                 @"dreamID": @"id",
                 @"dreamTitle": @"title",
                 @"dreamDescripe": @"des"
                 
                 };
    }];
    
    
    //字典数组 转 模型数组
    array = [DreamInfo mj_objectArrayWithKeyValuesArray:tempArray];
    return array;
}



@end
