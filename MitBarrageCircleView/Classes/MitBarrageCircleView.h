//
//  MitBarrageCircleView.h
//  mc
//
//  Created by Meng,Chen on 2017/4/12.
//  Copyright © 2017年 mc. All rights reserved.
//


/**
 使用实例：
 
 __block NSArray * arr = @[@"脱口秀",@"城会玩",@"毕业设计动画",@"第一视角",@"奇葩说",@"百度",@"周杰伦",@"中超进球集锦",@"好歌曲",@"冰与火的战争",@"粉丝自制",@"线下campaign",@"养花教程",@"国际品牌广告"];
 NSMutableArray *data = [NSMutableArray arrayWithCapacity:0];
 NSMutableArray * tempArr = [NSMutableArray arrayWithCapacity:0];
 tempArr = [NSMutableArray arrayWithCapacity:0];
 for (int i = 0; i<arr.count; i++) {
     MitBarrageItem * mol = [MitBarrageItem new];
     mol.contentFont = 14;
     mol.contentHeight = 28;
     mol.content = arr[i];
     if (i % 3 == 0) {
     mol.isHighLighted = true;
     }
     mol.highlightedTxtColor = [UIColor brownColor];
     mol.highlightedBorderColor = [UIColor brownColor];
     mol.normalTxtColor = [UIColor blackColor];
     mol.normalBorderColor = [UIColor blackColor];
     [tempArr addObject:mol];
     }
 [data addObject:[tempArr copy]];
 
 tempArr = [NSMutableArray arrayWithCapacity:0];
 for (int j = (int)arr.count -1; j>0; j--) {
     MitBarrageItem * mol = [MitBarrageItem new];
     mol.contentFont = 14;
     mol.contentHeight = 28;
     mol.content = arr[j];
     if (j % 3 == 0) {
     mol.isHighLighted = true;
     }
     mol.highlightedTxtColor = [UIColor brownColor];
     mol.highlightedBorderColor = [UIColor brownColor];
     mol.normalTxtColor = [UIColor blackColor];
     mol.normalBorderColor = [UIColor blackColor];
     [tempArr addObject:mol];
 }
 [data addObject:[tempArr copy]];
 
 MitBarrageCircleView * vi = [MitBarrageCircleView scrollViewWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, 200)];
 vi.dataSource = [data copy];
 vi.clickBack = ^(MitBarrageItem * item, NSInteger currentIndex) {
 NSLog(@"内容 = %@",item.content);
 };
 [self.view addSubview:vi];
 */

#import <UIKit/UIKit.h>
#import "MitBarrageContentView.h"
@class MitBarrageItem;



/**
 item 点击回调
 
 @param item 传递的模型
 @param currentIndex 当前点击的序号
 */
typedef void (^BDHJSearchBarrageItemClickBack)(MitBarrageItem * item, NSInteger currentIndex);

@interface MitBarrageCircleView : UIView

/**
 遍历初始化方式

 @param frame 尺寸
 @return 实例
 */
+ (instancetype)viewWithFrame:(CGRect)frame alignType:(MitAlignType)type;

/**
 数据源
 @abstract 数组内的数据格式暂定为 item 数组，方便以后扩展。
 */
@property (nonatomic, strong) NSArray<NSArray*> * dataSource;

/**
 item 点击回调
 */
@property (nonatomic, copy) BDHJSearchBarrageItemClickBack clickBack;

/**
 列表背景颜色
 */
@property (nonatomic, strong) UIColor * collectionBackColor;



@end
