//
//  CollectionTableViewCell.m
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "CollectionTableViewCell.h"
#import "ListCollectionViewCell.h"
#import "RecommandRadioDetailModel.h"
#import "BoZhuDetailModel.h"
#import "CEllCollectionViewCell.h"

@interface CollectionTableViewCell ()<UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, weak) UICollectionView *buttomView;



@property (nonatomic, strong) NSArray *dataArr;

@end

@implementation CollectionTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]
                                              init];
        layout.scrollDirection =UICollectionViewScrollDirectionHorizontal;

        layout.minimumLineSpacing = 0;
        
        self.buttomView.showsHorizontalScrollIndicator = NO;
        
        
        UICollectionView *buttomView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
        buttomView.delegate = self;
        buttomView.dataSource = self;
        [self.contentView addSubview:buttomView];
        self.buttomView = buttomView;
        self.buttomView.backgroundColor = [UIColor whiteColor];
        [self.buttomView registerClass:[ListCollectionViewCell class] forCellWithReuseIdentifier:@"ListColl"];

//        [self.buttomView registerNib:[UINib nibWithNibName:@"BoZhuCollectionCell" bundle:nil] forCellWithReuseIdentifier:@"BoZhuCollection"];
        [self.buttomView registerClass:[CEllCollectionViewCell class] forCellWithReuseIdentifier:@"BoZhuCollection"];
    }
    return self;
}



- (void)layoutSubviews {
    [super layoutSubviews];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]
                                          init];
    
    self.buttomView.collectionViewLayout = layout;
    self.buttomView.frame = CGRectMake(0, 10, self.frame.size.width, self.frame.size.height - 10);
    layout.itemSize = CGSizeMake(self.frame.size.width / 3 - 20, self.buttomView.frame.size.height);
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    ListCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ListColl" forIndexPath:indexPath];
    if ([self.dataArr[indexPath.item] isKindOfClass:[RecommandRadioDetailModel class]]) {
        cell.recommandModel = self.dataArr[indexPath.item];
    }else if([self.dataArr[indexPath.item] isKindOfClass:[BoZhuDetailModel class]]) {
        CEllCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"BoZhuCollection" forIndexPath:indexPath];
        cell.model = self.dataArr[indexPath.item];
        return cell;
    }else {
        cell.model = self.dataArr[indexPath.item];
    }
   
    
    return cell;
}


- (void)setModel:(ListModel *)model {
    self.dataArr = [NSArray array];
    _model = model;
    self.dataArr = model.list;
    [self.buttomView reloadData];
}

- (void)setRecommendModel:(RecommandRadioListModel *)recommendModel {
    self.dataArr = [NSArray array];
    _recommendModel = recommendModel;
    self.dataArr = recommendModel.list;
    [self.buttomView reloadData];
}

- (void)setBoZhuModel:(BoZhuModel *)boZhuModel {
    _dataArr = [NSArray array];
    _boZhuModel = boZhuModel;
    self.dataArr = boZhuModel.list;
    [self.buttomView reloadData];
}

@end
