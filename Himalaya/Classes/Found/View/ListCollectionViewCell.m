//
//  ListCollectionViewCell.m
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "ListCollectionViewCell.h"
#import "DetailModel.h"
#import <UIImageView+WebCache.h>

@interface ListCollectionViewCell ()

@property (nonatomic, strong) UIImageView *imgView;

@property (nonatomic, strong) UILabel *title;

@property (nonatomic, strong) UILabel *subTitle;


@end

@implementation ListCollectionViewCell


- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.imgView = [[UIImageView alloc] init];
        [self.contentView addSubview:_imgView];
        
        self.subTitle = [[UILabel alloc] init];
        self.subTitle.backgroundColor = [UIColor blackColor];
        self.subTitle.alpha = 0.7;
        self.subTitle.textColor = [UIColor whiteColor];
        self.subTitle.textAlignment = NSTextAlignmentCenter;
        self.subTitle.font = [UIFont systemFontOfSize:12];
        [self.imgView addSubview:self.subTitle];
        
        self.title = [[UILabel alloc] init];
        self.title.numberOfLines = 2;
        self.title.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.title];
        
    }
    return self;
}

- (void)setModel:(DetailModel *)model {
    _model = model;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.coverLarge]];
    self.subTitle.text = model.title;
    self.title.text = model.trackTitle;
    self.subTitle.alpha = 0.7;
}

- (void)setRecommandModel:(RecommandRadioDetailModel *)recommandModel {
    _recommandModel = recommandModel;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:recommandModel.picPath]];
    self.title.text = recommandModel.rname;
    self.subTitle.alpha = 0;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    CGFloat imgViewWH = self.frame.size.width;
    
    self.imgView.frame = CGRectMake(0, 0, imgViewWH, imgViewWH);
    
    self.title.frame = CGRectMake(0, imgViewWH, imgViewWH, self.frame.size.height - imgViewWH);
    self.subTitle.frame  = CGRectMake(0, imgViewWH - 20, imgViewWH, 20);
}

@end
