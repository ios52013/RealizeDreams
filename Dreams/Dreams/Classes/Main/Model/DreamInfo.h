//
//  DreamInfo.h
//  Dreams
//
//  Created by HYRLoveQi on 16/8/31.
//  Copyright © 2016年 黄永锐. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DreamInfo : NSObject
//
@property (nonatomic, copy) NSString *dreamID;
@property (nonatomic, copy) NSString *dreamTitle;//梦的标题
@property (nonatomic, copy) NSString *dreamDescripe;//描述
@property (nonatomic, strong) NSMutableArray *lists;


@end
