//
//  MitBarrageContentView.m
//  Hao123News
//
//  Created by Meng,Chen on 2017/4/12.
//  Copyright © 2017年 Baidu. All rights reserved.
//

#import "MitBarrageContentView.h"
#import "MitBarrageItem.h"
#import "MitBarrageCell.h"
@interface MitBarrageContentView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>



@end

@implementation MitBarrageContentView

#pragma mark - life circle

- (void)dealloc
{
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;

}




#pragma mark - override
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self addSubview:self.collectionView];
        [self.collectionView reloadData];
        
    }
    return self;
}
#pragma mark - public methods
-(void)setDataSource:(NSArray<MitBarrageItem *> *)dataSource{
    _dataSource = dataSource;
    [self.collectionView reloadData];
}

#pragma mark - privater methods


#pragma mark - target methods


#pragma mark - notification methods


#pragma mark - delegate methods implementation


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return self.dataSource.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MitBarrageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([MitBarrageCell class]) forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    return cell;
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    MitBarrageItem * item = self.dataSource[indexPath.row];
    if (self.clickBack) {
        self.clickBack(item,indexPath.row);
    }
}


#pragma mark - UICollectionViewDelegateFlowLayout method
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataSource.count>0) {
        MitBarrageItem * mol = self.dataSource[indexPath.row];
        return CGSizeMake(mol.calculateContentWidth, mol.contentHeight);
    }else{
        return CGSizeZero;
    }
    
}


#pragma mark - property

/**
 列表

 @return 列表实例
 */
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        BDHKCollectionViewLeftAlignedLayout *flowLayout = [[BDHKCollectionViewLeftAlignedLayout alloc] init];
        flowLayout.minimumInteritemSpacing = 10;
        flowLayout.minimumLineSpacing = 10;
        flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
        flowLayout.scrollDirection = UICollectionViewScrollDirectionVertical;
        UICollectionView * vi= [[UICollectionView alloc]initWithFrame:self.bounds collectionViewLayout:flowLayout];
        vi.delegate = self;
        vi.dataSource = self;
        vi.bounces = true;
        vi.backgroundColor = [UIColor whiteColor];
        [vi registerClass:[MitBarrageCell class] forCellWithReuseIdentifier:NSStringFromClass([MitBarrageCell class])];
        _collectionView = vi;
    }
    return _collectionView;
}
@end
