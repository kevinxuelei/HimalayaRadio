//
//  HeaderView.m
//  Himalaya
//
//  Created by lanou3g on 15/10/28.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "DiscoverHeaderView.h"

@interface DiscoverHeaderView ()

@property (nonatomic, weak) UIImageView *leftImg;

@property (nonatomic, weak) UILabel *leftLabel;

@property (nonatomic, weak) UIImageView *rightImg;

@property (nonatomic, weak) UILabel *rightLabel;

@end

@implementation DiscoverHeaderView

- (void)setRightBtnIsHidden:(BOOL)hidden {
    if (hidden) {
        self.rightImg.hidden = YES;
        self.rightLabel.hidden = YES;
    }else {
        self.rightImg.hidden = NO;
        self.rightLabel.hidden = NO;
    }
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UIImageView *leftImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iconfont-youjiantou"]];
        
        UILabel *leftLabel = [[UILabel alloc] init];
        
        leftLabel.font = [UIFont systemFontOfSize:12];
        
        UIImageView *rightImg = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"iconfont-youjiantou-2"]];
        
        UILabel *rightLabel = [[UILabel alloc] init];
        
        rightLabel.font = [UIFont systemFontOfSize:12];
        rightLabel.text = @"更多";
        
        rightLabel.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:leftImg];
        [self addSubview:leftLabel];
        [self addSubview:rightImg];
        [self addSubview:rightLabel];
        self.leftLabel = leftLabel;
        self.leftImg = leftImg;
        self.rightImg = rightImg;
        self.rightLabel = rightLabel;

    
    }
    return self;
}

- (void)setTitle:(NSString *)title {
    self.leftLabel.text = title;
}


- (void)layoutSubviews {
    [super layoutSubviews];

    self.leftImg.frame = CGRectMake(10, 10, 20, 13);
    self.leftLabel.frame = CGRectMake(30, 5, 60, 20);
    
    self.rightImg.frame = CGRectMake(self.frame.size.width - 20, 5, 20, 20);
    self.rightLabel.frame = CGRectMake(CGRectGetMinX(self.rightImg.frame) - 20, 5, 40, 20);
    
}

@end
