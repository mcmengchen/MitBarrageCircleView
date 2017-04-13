//
//  MitBarrageCell.h
//  mc
//
//  Created by Meng,Chen on 2017/4/12.
//  Copyright © 2017年 mc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MitBarrageItem;

@interface MitBarrageCell : UICollectionViewCell
/* 
 数据源
 */
@property (nonatomic, strong) MitBarrageItem * model;
@end
