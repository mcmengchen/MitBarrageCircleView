//
//  MitBarrageContentView.h
//  Hao123News
//
//  Created by Meng,Chen on 2017/4/12.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MitBarrageItem;


/**
 item 点击回调

 @param item 数据模型
 @param index 点击序号
 */
typedef void (^MitBarrageContentViewClickBack)(MitBarrageItem * item,NSInteger index);

@interface MitBarrageContentView : UIView
/**
 数据源 
 */
@property (nonatomic, strong) NSArray<MitBarrageItem*> * dataSource;

/**
 列表
 */
@property (nonatomic, weak) UICollectionView * collectionView;

/**
 item 点击回调
 */
@property (nonatomic, copy) MitBarrageContentViewClickBack clickBack;
@end
