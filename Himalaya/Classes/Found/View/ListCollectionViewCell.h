//
//  ListCollectionViewCell.h
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DetailModel;
#import "RecommandRadioDetailModel.h"

@interface ListCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) RecommandRadioDetailModel *recommandModel;

@property (nonatomic, strong) DetailModel *model;

@end
