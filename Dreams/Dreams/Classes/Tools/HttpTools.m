//
//  HttpTools.m
//  Dreams
//
//  Created by aiqiyisheng on 16/8/30.
//  Copyright © 2016年 黄永锐. All rights reserved.

// http://v.juhe.cn/dream/category?key=您申请的key

#import "HttpTools.h"
#import <AFNetworking.h>
#import "HYRParse.h"
#import "DreamInfo.h"



@implementation HttpTools


//创建网络请求对象
+(AFHTTPSessionManager *)manager{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //超时时间
    manager.requestSerializer.timeoutInterval = kTimeOutInterval;
    
    // 声明上传的是json格式的参数，需要你和后台约定好，不然会出现后台无法获取到你上传的参数问题
    // 上传普通格式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    
#pragma mark - 上传json格式
    //manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    // 声明获取到的数据格式
    // AFN不会解析,数据是data，需要自己解析
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
#pragma mark - AFN会JSON解析返回的数据
    //manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    // 个人建议还是自己解析的比较好，有时接口返回的数据不合格会报3840错误，大致是AFN无法解析返回来的数据
    
    return manager;
}



//请求梦境类型
+(void)requestDreamTypeSuccess:(MyCallBack)success andFail:(MyCallBack)fail{
    //路径
    NSString *urlString = [NSString stringWithFormat:@"%@category?key=%@",kHostUrl,kAppKey];
    
    //创建请求对象
    AFHTTPSessionManager *manager = [self manager];
    //发起GET请求
    [manager GET:urlString parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
        //// 这里可以获取到目前数据请求的进度
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        
        if (responseObject) {
            //把请求回来的json字符串转换成字典
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            
            //调用解析类来解析数据模型
            NSMutableArray *resultArr = [HYRParse parseDreamsTypeWithDic:dict];
            //把转成功的字典 返回出去
            success(resultArr);
            
        }else{
            success(@{@"msg": @"暂无数据~"});
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //
        //请求失败
        NSString *reson = [error localizedDescription];
        fail(reson);//把请求错误的信息返回出去
    }];

    
}



//根据梦境中梦到的事物解梦
+(void)requestDreamDetailInfoWithSomething:(NSString*)something andSuccess:(MyCallBack)success andFail:(MyCallBack)fail{
    
    
    //路径
    NSString *urlString = [NSString stringWithFormat:@"%@query?",kHostUrl];
    //参数
    NSDictionary *parames = @{
                              @"key":kAppKey,
                              @"q":something
                              };
    
    //创建请求对象
    AFHTTPSessionManager *manager = [self manager];
    //发起POST请求
    [manager POST:urlString parameters:parames progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //// 这里可以获取到目前数据请求的进度
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        
        if (responseObject) {
            //把请求回来的json字符串转换成字典
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"根据梦境事物解析梦:%@",dict);
            //调用解析类来解析数据模型
            NSMutableArray *resultArr = [HYRParse parseDreamDetailInfoWithDic:dict];
            //把转成功的字典 返回出去
            success(resultArr);
            
        }else{
            success(@{@"msg": @"暂无数据~"});
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        NSString *reson = [error localizedDescription];
        fail(reson);//把请求错误的信息返回出去
    
    }];
    
}

// 根据ID查询解梦信息
+(void)requestDreamDetailByDreamID:(NSString*)did andSuccess:(MyCallBack)success andFail:(MyCallBack)fail{
    //路径
    NSString *urlString = [NSString stringWithFormat:@"%@queryid?",kHostUrl];
    //参数
    NSDictionary *parames = @{
                              @"key":kAppKey,
                              @"id":did
                              };
    
    //创建请求对象
    AFHTTPSessionManager *manager = [self manager];
    //发起POST请求
    [manager POST:urlString parameters:parames progress:^(NSProgress * _Nonnull uploadProgress) {
        
        //// 这里可以获取到目前数据请求的进度
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //请求成功
        
        if (responseObject) {
            //把请求回来的json字符串转换成字典
            NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
            NSLog(@"根据梦id解析梦:%@",dict);
            //调用解析类来解析数据模型
            DreamInfo *dreamDetail = [HYRParse parseDreamDetailWithDic:dict];
            //
            success(dreamDetail);
            
        }else{
            success(@{@"msg": @"暂无数据~"});
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        //请求失败
        NSString *reson = [error localizedDescription];
        fail(reson);//把请求错误的信息返回出去
        
    }];
}


@end
