//
//  HYRParse.h
//  Dreams
//
//  Created by aiqiyisheng on 16/8/30.
//  Copyright © 2016年 黄永锐. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DreamInfo.h"

@interface HYRParse : NSObject

//解析 梦的类型
+(NSMutableArray*)parseDreamsTypeWithDic:(NSDictionary *)dict;

//根据梦中的事物  解 梦的详情
+(NSMutableArray*)parseDreamDetailInfoWithDic:(NSDictionary *)dict;

//根据梦的id  解 梦的详情
+(DreamInfo*)parseDreamDetailWithDic:(NSDictionary *)dict;

@end
