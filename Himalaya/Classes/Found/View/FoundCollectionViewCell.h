//
//  FoundCollectionViewCell.h
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FoundCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *focusImagesArr;

@property (nonatomic, assign) NSNumber *maxPageId;

@end
