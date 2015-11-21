//
//  CEllCollectionViewCell.m
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "CEllCollectionViewCell.h"
#import <UIButton+WebCache.h>

@interface CEllCollectionViewCell ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

- (IBAction)attentionBtnClick:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *ImageBtn;

@property (nonatomic, strong) UIButton *attentionBtn;

@end

@implementation CEllCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UIButton *ImageBtn = [UIButton buttonWithType:UIButtonTypeCustom];;
        ImageBtn.frame = CGRectMake(10, 10, self.frame.size.width - 20, self.frame.size.width - 20);
        [self addSubview:ImageBtn];
        self.ImageBtn = ImageBtn;
        
        UILabel *label = [[UILabel alloc ] initWithFrame:CGRectMake(0, self.frame.size.width + 5 , self.frame.size.width, 20)];
        [self.contentView addSubview:label];
        self.nameLabel = label;
        self.nameLabel.textAlignment = NSTextAlignmentCenter;
        self.nameLabel.font = [UIFont systemFontOfSize:14];
        self.attentionBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        self.attentionBtn.frame = CGRectMake((self.frame.size.width - 60)/ 2, self.frame.size.width + 20, 60, 40);
        [self.attentionBtn setBackgroundImage:[UIImage imageNamed:@"iconfont-jiaguanzhu"] forState:UIControlStateNormal];
        [self addSubview:self.attentionBtn];
        
    }
    return self;
}

- (void)setModel:(BoZhuDetailModel *)model {
    _model = model;
    
    [self.ImageBtn sd_setImageWithURL:[NSURL URLWithString:model.smallLogo] forState:UIControlStateNormal placeholderImage:[UIImage imageNamed:@"iconfont-imageplaceholder"]];
    self.nameLabel.text = model.nickname;
}



- (IBAction)attentionBtnClick:(UIButton *)sender {
    
}
@end
