//
//  SpecialColumnCell.h
//  Himalaya
//
//  Created by lanou3g on 15/10/28.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

typedef void(^BLOCK)();

#import <UIKit/UIKit.h>
@class SpecialColumnDetailModel;
@class TopRadioDetailModel;

@interface SpecialColumnCell : UITableViewCell

@property (nonatomic, strong) TopRadioDetailModel *topRadioModel;

@property (nonatomic, strong) SpecialColumnDetailModel *model;

@property (nonatomic, copy) BLOCK block;

@end
