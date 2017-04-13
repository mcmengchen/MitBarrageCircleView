
//
//  MitBarrageCircleView.m
//  mc
//
//  Created by Meng,Chen on 2017/4/12.
//  Copyright © 2017年 mc. All rights reserved.
//

#import "MitBarrageCircleView.h"
#import "MitBarrageContentView.h"
@interface MitBarrageCircleView ()<UIScrollViewDelegate>
/**
 滚动视图
 */
@property(nonatomic,weak)UIScrollView * scrollView;
/**
 当前页
 */
@property (nonatomic, assign) NSInteger currentPage;
/**
 定时器
 */
@property(nonatomic, strong)CADisplayLink * timer;

/** 
 约束类型
 */
@property (nonatomic, assign) MitAlignType collectionAlignType;
@end

//默认创建3个内容视图
static NSInteger kDefaultNumOfContentViews = 3;
@implementation MitBarrageCircleView

#pragma mark - life circle

- (void)dealloc
{
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    //设置scrollView的frame
    self.scrollView.frame = self.bounds;
    self.scrollView.contentSize = CGSizeMake(kDefaultNumOfContentViews * self.bounds.size.width, 0);
    //设置imageView的frame
    for (int i = 0; i<kDefaultNumOfContentViews; i++) {
        MitBarrageContentView * vi = self.scrollView.subviews[i];
        vi.frame = CGRectMake(i * self.scrollView.frame.size.width, 0, self.scrollView.frame.size.width, self.scrollView.frame.size.height);
    }
    //设置内容
    [self updateContent];
}


#pragma mark - override

-(instancetype)initWithFrame:(CGRect)frame alignType:(MitAlignType)type{
    if (self = [super initWithFrame:frame]) {
        self.scrollView.hidden = false;
        self.collectionAlignType = type;
        [self createContentView];
    }
    return self;
}

#pragma mark - public methods

/**
 便利初始化方式

 @param frame 尺寸
 @return 实例
 */
+(instancetype)viewWithFrame:(CGRect)frame alignType:(MitAlignType)type{
    return [[self alloc] initWithFrame:frame alignType:type];
}

/**
 设置数据源
 @param dataSource 数据源
 */
-(void)setDataSource:(NSArray<NSArray*> *)dataSource{
    if (!dataSource||!(dataSource.count>0)) {
        return;
    }
    _dataSource = dataSource;
    // 设置当前页
    self.currentPage = 0;
    // 设置内容
    [self updateContent];
    // 开始定时器
    [self startTimer];
}
-(void)setCollectionBackColor:(UIColor *)collectionBackColor{
    _collectionBackColor = collectionBackColor;
    if (self.scrollView.subviews.count>0) {
        for (MitBarrageContentView * vi in self.scrollView.subviews) {
            vi.collectionView.backgroundColor = collectionBackColor;
        }
    }
}

#pragma mark - privater methods

/**
 开始计时器
 */
-(void)startTimer{
    if (_timer) {
        [_timer invalidate];
        _timer = nil;
    }
    CADisplayLink * timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(move)];
    [timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    _timer = timer;
}

/**
 滚动视图移动
 */
- (void)move
{
    self.scrollView.contentOffset = CGPointMake(self.scrollView.contentOffset.x+0.5, self.scrollView.contentOffset.y);
    if (self.scrollView.contentOffset.x>=2*self.scrollView.frame.size.width||self.scrollView.contentOffset.x==0) {
        [self updateContent];
    }
}


/**
 刷新内容
 */
- (void)updateContent{
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        MitBarrageContentView * vi = self.scrollView.subviews[i];
        NSInteger index = self.currentPage;
        if (i == 0) {
            index--;
        } else if (i == 2) {
            index++;
        }
        if (index < 0) {
            index = self.dataSource.count - 1;
        } else if (index >= self.dataSource.count) {
            index = 0;
        }
        vi.tag = index;
        vi.dataSource = self.dataSource[index];
    }
    // 设置偏移量在中间
    self.scrollView.contentOffset = CGPointMake(self.scrollView.frame.size.width, 0);
}

/**
 停止计时器
 */
- (void)stopTimer
{
    [self.timer removeFromRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    [self.timer invalidate];
    self.timer = nil;
}



#pragma mark - target methods


#pragma mark - notification methods


#pragma mark - delegate methods implementation
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger page = 0;
    CGFloat minDistance = MAXFLOAT;
    for (int i = 0; i<self.scrollView.subviews.count; i++) {
        MitBarrageContentView * vi = self.scrollView.subviews[i];
        CGFloat distance = 0;
        distance = ABS(vi.frame.origin.x - scrollView.contentOffset.x);
        if (distance < minDistance) {
            minDistance = distance;
            page = vi.tag;
        }
    }
    self.currentPage = page;
    if (self.scrollView.contentOffset.x>=2*self.scrollView.frame.size.width||self.scrollView.contentOffset.x==0) {
        [self updateContent];
    }
    
    
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self stopTimer];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}


#pragma mark - property

/**
 滚动视图
 */
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        UIScrollView *scrollView = [[UIScrollView alloc] init];
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.decelerationRate = 0.1;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.pagingEnabled = false;
        scrollView.bounces = NO;
        scrollView.delegate = self;
        [self addSubview:scrollView];
        _scrollView = scrollView;
    }
    return _scrollView;
}


/**
 滚动视图的内容视图
 */
- (void)createContentView{
    for (int i = 0; i<kDefaultNumOfContentViews; i++) {
        MitBarrageContentView * vi = [MitBarrageContentView viewWithFrame:self.bounds alignType:self.collectionAlignType];
        if (self.collectionBackColor) {
            vi.collectionView.backgroundColor = self.collectionBackColor;
        }else{
            vi.collectionView.backgroundColor = [UIColor whiteColor];
        }
        vi.dataSource = self.dataSource[i];
        __weak __typeof__(self) weakSelf = self;
        //点击回调
        vi.clickBack = ^(MitBarrageItem *item, NSInteger index) {
            __strong __typeof__(self) strongSelf = weakSelf;
            if (strongSelf.clickBack) {
                strongSelf.clickBack(item,index);
            }
        };
        [_scrollView addSubview:vi];
    }
}
@end
