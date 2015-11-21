//
//  DiscoveryColumnsCell.m
//  Himalaya
//
//  Created by lanou3g on 15/10/28.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "DiscoveryColumnsCell.h"
#import "DiscoveryColumnsListModel.h"
#import <UIImageView+WebCache.h>

@implementation DiscoveryColumnsCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier]) {
        
    }
    return self;
}

- (void)setModel:(DiscoveryColumnsListModel *)model {
    _model = model;
    self.textLabel.text = model.title;
    self.detailTextLabel.text = model.subtitle;
    [self.imageView sd_setImageWithURL:[NSURL URLWithString:model.coverPath] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {

    }];

}

@end
