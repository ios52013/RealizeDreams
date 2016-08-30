//
//  DreamFlowLayout.m
//  Dreams
//
//  Created by aiqiyisheng on 16/8/30.
//  Copyright © 2016年 黄永锐. All rights reserved.
//

#import "DreamFlowLayout.h"

@implementation DreamFlowLayout


//创建布局对象时，设置与布局有关的参数信息
-(instancetype)init{
    self = [super init];
    if (self) {
        //由于继承自flowLayout,所以才有以下属性，
        //如果继承自UICollectionViewLayout，则没有如下属性
        self.itemSize = CGSizeMake(300, 300);
        //行距离
        self.minimumLineSpacing = 100;
        //每一行里面cell的距离
        self.minimumInteritemSpacing = 10;
        
        //分区间的内边距
        self.sectionInset = UIEdgeInsetsMake((self.collectionView.frame.size.height-300)/2, (self.collectionView.frame.size.width-300)/2, (self.collectionView.frame.size.height-300)/2, (self.collectionView.frame.size.width-300)/2);
        
        //滑动方向  水平滚动
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
    }
    
    return self;
}


@end
