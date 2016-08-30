//
//  DreamCollectionViewCell.m
//  Dreams
//
//  Created by aiqiyisheng on 16/8/29.
//  Copyright © 2016年 黄永锐. All rights reserved.
//

#import "DreamCollectionViewCell.h"

@implementation DreamCollectionViewCell

//初始化
-(instancetype)init{
    self = [super init];
    if (self) {
        [self createUI];
    }
    
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self createUI];
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

//创建界面
-(void)createUI{
    self.backgroundColor = [UIColor magentaColor];
    //
    self.layer.borderWidth = 2;
    self.layer.borderColor = [UIColor whiteColor].CGColor;
    //
    _typeLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, self.frame.size.height - 55, self.frame.size.width-10, 50)];
    _typeLabel.textAlignment = NSTextAlignmentCenter;
    _typeLabel.font = [UIFont systemFontOfSize:28];
    _typeLabel.backgroundColor = [UIColor lightGrayColor];
    
    [self.contentView addSubview:_typeLabel];
}

-(void)setDreamType:(DreamType *)dreamType{
    
    _dreamType = dreamType;
    _typeLabel.text = [NSString stringWithFormat:@"%@: %@",_dreamType.typeId,_dreamType.typeName];
}

@end



