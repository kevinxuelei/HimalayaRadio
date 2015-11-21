//
//  CategoryTableViewCell.m
//  Himalaya
//
//  Created by lanou3g on 15/10/28.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "CategoryTableViewCell.h"
#import <UIButton+WebCache.h>
#import "CategoryModel.h"
#import "CategoryBtn.h"

@implementation CategoryTableViewCell

- (void)layoutSubviews {
    [super layoutSubviews];

    for (int i = 0; i <self.contentView.subviews.count; i++) {
        CategoryBtn *btn = self.contentView.subviews[i];
        CGFloat btnW = self.frame.size.width / 2;

        btn.frame = CGRectMake(btnW * (i%2), 40 * (i/2), btnW, 40);
        btn.layer.borderWidth = 0.3;
        btn.layer.borderColor = [UIColor colorWithRed:190/255.0 green:190/255.0 blue:190/255.0 alpha:0.3].CGColor;


    }
}
- (void)setDataArr:(NSArray *)dataArr {
    if (!_dataArr) {
        _dataArr = dataArr;
        for (int i = 0; i <dataArr.count; i++) {
            CategoryModel *model = dataArr[i];
            CategoryBtn *button = [[CategoryBtn alloc] init];
            [button setTitle:model.title forState:UIControlStateNormal];
            [button sd_setImageWithURL:[NSURL URLWithString:model.coverPath] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

            [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [self.contentView addSubview:button];
        }
    }
}
- (void)btnClick:(CategoryBtn *)btn {
    NSLog(@"-----------------");
}
@end
