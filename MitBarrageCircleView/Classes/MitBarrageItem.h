//
//  MitBarrageItem.h
//  Hao123News
//
//  Created by Meng,Chen on 2017/4/12.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import "BDHKJastor.h"

@interface MitBarrageItem : BDHKJastor
/** 文本内容 */
@property (nonatomic, copy) NSString * content;
/** 文本高度 */
@property (nonatomic, assign) CGFloat contentHeight;
/** 文本大小 */
@property (nonatomic, assign) CGFloat contentFont;
/** 计算出的文本宽度 */
@property (nonatomic, assign) CGFloat calculateContentWidth;
/** 是否是高亮 */
@property (nonatomic, assign) BOOL isHighLighted;
/* 高亮边框颜色 */
@property (nonatomic, strong) UIColor * highlightedBorderColor;
/* 正常边框颜色 */
@property (nonatomic, strong) UIColor * normalBorderColor;
/* 高亮文本颜色 */
@property (nonatomic, strong) UIColor * highlightedTxtColor;
/* 正常文本颜色 */
@property (nonatomic, strong) UIColor * normalTxtColor;
@end
