//
//  MitBarrageContentView.h
//  mc
//
//  Created by Meng,Chen on 2017/4/12.
//  Copyright © 2017年 mc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MitBarrageItem;

typedef NS_ENUM(NSUInteger, MitAlignType) {
    MitAlignTypeDefault = 0,
    MitAlignTypeLeft = 1,
    MitAlignTypeRight = 2,
};
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
/** 
 约束类型 
 */
@property (nonatomic, assign) MitAlignType alignType;


/**
 便利初始化方式

 @param frame 尺寸
 @param alignType 约束类型
 @return 返回实例
 */
+(instancetype)viewWithFrame:(CGRect)frame alignType:(MitAlignType)alignType;

@end
