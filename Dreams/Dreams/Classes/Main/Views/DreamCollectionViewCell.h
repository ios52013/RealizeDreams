//
//  DreamCollectionViewCell.h
//  Dreams
//
//  Created by aiqiyisheng on 16/8/29.
//  Copyright © 2016年 黄永锐. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DreamType.h"

@interface DreamCollectionViewCell : UICollectionViewCell

//
@property (nonatomic, strong)DreamType *dreamType;
@property (nonatomic, strong)UILabel *typeLabel;
@property (nonatomic, strong)UIImageView *typeImageView;

@end
