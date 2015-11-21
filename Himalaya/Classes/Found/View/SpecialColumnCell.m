//
//  SpecialColumnCell.m
//  Himalaya
//
//  Created by lanou3g on 15/10/28.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "SpecialColumnCell.h"
#import <UIImageView+WebCache.h>
#import "SpecialColumnDetailModel.h"
#import "topRadioDetailModel.h"


@interface SpecialColumnCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *subTitle;
@property (weak, nonatomic) IBOutlet UILabel *footnote;
@end

@implementation SpecialColumnCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    return self;
}

- (void)setModel:(SpecialColumnDetailModel *)model {
    _model = model;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.coverPath] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.block();
    }];
     self.title.text = model.title;
     self.subTitle.text = model.subtitle;
     self.footnote.text = model.footnote;
}

- (void)setTopRadioModel:(TopRadioDetailModel *)topRadioModel {
    _topRadioModel = topRadioModel;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:topRadioModel.radioCoverLarge]placeholderImage:[UIImage imageNamed:@"iconfont-imageplaceholder"] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        self.block();
    }];
    self.title.text = topRadioModel.rname;
    self.subTitle.text =[NSString stringWithFormat:@"正在直播:  %.2f万人",topRadioModel.radioPlayCount/10000.0];
    self.footnote.text = topRadioModel.programName;

}

@end
