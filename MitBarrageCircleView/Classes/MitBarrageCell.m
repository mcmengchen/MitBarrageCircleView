//
//  MitBarrageCell.m
//  Hao123News
//
//  Created by Meng,Chen on 2017/4/12.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import "MitBarrageCell.h"
#import "MitBarrageItem.h"
@interface MitBarrageCell ()


/**
 内容文本
 */
@property (nonatomic, weak) UILabel * contentLab;


@end

@implementation MitBarrageCell

#pragma mark - life circle

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {

    }
    return self;
}

- (void)dealloc
{
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.contentLab.frame = self.bounds;
    self.contentLab.layer.cornerRadius = self.contentLab.frame.size.height*0.5;
}

#pragma mark - override


#pragma mark - public methods
- (void)setModel:(MitBarrageItem *)model{
    _model = model;
    self.contentLab.text = model.content;
    self.contentLab.font = [UIFont systemFontOfSize:model.contentFont];
    if (model.isHighLighted) {
        self.contentLab.textColor = model.highlightedTxtColor;
        self.contentLab.layer.borderColor = model.highlightedBorderColor.CGColor;
    }else{
        self.contentLab.textColor = model.normalTxtColor;
        self.contentLab.layer.borderColor = model.normalBorderColor.CGColor;
        
    }
}

#pragma mark - privater methods


#pragma mark - target methods


#pragma mark - notification methods


#pragma mark - delegate methods implementation


#pragma mark - property
-(UILabel *)contentLab{
    if (!_contentLab) {
        UILabel * label  = [[UILabel alloc]initWithFrame:self.bounds];
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.masksToBounds = true;
        label.layer.borderColor = [UIColor blackColor].CGColor;
        label.layer.borderWidth = 1;
        label.backgroundColor = [UIColor whiteColor];
        label.textColor = [UIColor blackColor];
        _contentLab = label;
        [self addSubview:label];
    }
    return _contentLab;
}

@end
