//
//  JZQLayout.m
//  Habit
//
//  Created by JZQ on 2018/6/14.
//  Copyright © 2018年 Jacano King. All rights reserved.
//

#import "JZQLayout.h"

@implementation JZQLayout

- (void)prepareLayout{
    [super prepareLayout];
    //水平滚动
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.minimumLineSpacing=40;
    CGFloat margin=(self.collectionView.frame.size.width-self.itemSize.width)/2;
    
    self.collectionView.contentInset = UIEdgeInsetsMake(0, margin, 0, margin);
    
    
}

//滑动刷新视图
- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds
{
    return YES;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect
{
    //让父类布局好样式
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    //计算出collectionView的中心的位置
    //    CGFloat ceterX = self.collectionView.contentOffset.x + self.collectionView.frame.size.width * 0.5;
    /**
     * 1.一个cell对应一个UICollectionViewLayoutAttributes对象
     * 2.UICollectionViewLayoutAttributes对象决定了cell的frame
     */
    //    for (UICollectionViewLayoutAttributes *attributes in arr) {
    //        //cell的中心点距离collectionView的中心点的距离，注意ABS()表示绝对值
    //        CGFloat delta = ABS(attributes.center.x - ceterX);
    //        //设置缩放比例
    //        CGFloat scale = 1 - delta / self.collectionView.frame.size.width*0.4;
    //        //设置cell滚动时候缩放的比例
    //        attributes.transform = CGAffineTransformMakeScale(scale, 1);
    //    } 
    return arr;
}

- (CGPoint)targetContentOffsetForProposedContentOffset:(CGPoint)proposedContentOffset withScrollingVelocity:(CGPoint)velocity
{
    // 计算出最终显示的矩形框
    CGRect rect;
    rect.origin.y = 0;
    rect.origin.x = proposedContentOffset.x;
    rect.size = self.collectionView.frame.size;
    
    //获得super已经计算好的布局的属性
    NSArray *arr = [super layoutAttributesForElementsInRect:rect];
    
    //计算collectionView最中心点的x值
    CGFloat centerX = proposedContentOffset.x + self.collectionView.frame.size.width * 0.5;
    
    CGFloat minDelta = MAXFLOAT;
    for (UICollectionViewLayoutAttributes *attrs in arr) {
        if (ABS(minDelta) > ABS(attrs.center.x - centerX)) {
            minDelta = attrs.center.x - centerX;
        }
    }
    proposedContentOffset.x += minDelta;
    return proposedContentOffset;
}




@end
