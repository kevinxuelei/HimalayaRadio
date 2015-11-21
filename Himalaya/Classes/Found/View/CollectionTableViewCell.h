//
//  CollectionTableViewCell.h
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListModel.h"
#import "RecommandRadioListModel.h"
#import "BoZhuModel.h"

@interface CollectionTableViewCell : UITableViewCell

@property (nonatomic, strong) RecommandRadioListModel *recommendModel;

@property (nonatomic, strong) ListModel *model;

@property (nonatomic, strong) BoZhuModel *boZhuModel;

@end
