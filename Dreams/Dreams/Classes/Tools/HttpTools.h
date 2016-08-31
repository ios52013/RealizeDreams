//
//  HttpTools.h
//  Dreams
//
//  Created by aiqiyisheng on 16/8/30.
//  Copyright © 2016年 黄永锐. All rights reserved.
//

#import <Foundation/Foundation.h>

//声明一个block
typedef void(^MyCallBack)(id obj);


@interface HttpTools : NSObject

//请求梦境类型
+(void)requestDreamTypeSuccess:(MyCallBack)success andFail:(MyCallBack)fail;

//根据梦境中梦到的事物解梦
+(void)requestDreamDetailInfoWithSomething:(NSString*)something andSuccess:(MyCallBack)success andFail:(MyCallBack)fail;

// 根据ID查询解梦信息
+(void)requestDreamDetailByDreamID:(NSString*)did andSuccess:(MyCallBack)success andFail:(MyCallBack)fail;


@end
