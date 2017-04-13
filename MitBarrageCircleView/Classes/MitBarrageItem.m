//
//  MitBarrageItem.m
//  Hao123News
//
//  Created by Meng,Chen on 2017/4/12.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import "MitBarrageItem.h"

@implementation MitBarrageItem


//默认文本高度
static CGFloat kDefaultHeight = 28;
//默认文本大小
static CGFloat kDefaultFont = 17;
//给定文本大小与计算文本大小之间需要一个增量，以保证label的宽度>文字的宽度
static CGFloat kDefaultFontDistance = 4;
-(void)setContent:(NSString *)content{
    _content = content;
    CGFloat height = kDefaultHeight;
    if (self.contentHeight > 0) {
        height = self.contentHeight;
    }
    CGFloat fontSize = kDefaultFont;
    if (self.contentFont > 0) {
        fontSize = self.contentFont+kDefaultFontDistance;
    }
    CGSize titleSize = [content boundingRectWithSize:CGSizeMake(MAXFLOAT, kDefaultHeight) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]} context:nil].size;
    NSLog(@"计算出的文本高度 = %f",titleSize.width);
    self.calculateContentWidth = titleSize.width;
}
@end
