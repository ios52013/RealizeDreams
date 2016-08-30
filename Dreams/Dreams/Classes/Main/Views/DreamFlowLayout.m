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
        //[self initLayou];
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        //
        //[self initLayou];
    }
    return self;
}

#pragma mark - 故事版里面使用自定义布局的时候 最关键的一步
//在故事版里面 选择了collectionView 然后在第四个检查器 的Layout选择 Custom
//在class里面 选择这个自定义的布局类 DreamFlowLayout

-(void)awakeFromNib{
    [self initLayou];
}


-(void)initLayou{
    //由于继承自flowLayout,所以才有以下属性，
    //如果继承自UICollectionViewLayout，则没有如下属性
    self.itemSize = CGSizeMake(300, 300);
    //行距离
    self.minimumLineSpacing = 30;
    //每一行里面cell的距离
    self.minimumInteritemSpacing = 10;
    
    //分区间的内边距
    self.sectionInset = UIEdgeInsetsMake((self.collectionView.frame.size.height-300)/2, 30, (self.collectionView.frame.size.height-300)/2, (self.collectionView.frame.size.width-300)/2);
    
    //滑动方向  水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
}


@end
