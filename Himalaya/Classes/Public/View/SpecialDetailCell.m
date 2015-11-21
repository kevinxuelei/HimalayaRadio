//
//  SpecialDetailCell.m
//  Himalaya
//
//  Created by lanou3g on 15/10/30.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "SpecialDetailCell.h"
#import "TallyView.h"
#import "NSString+Extension.h"

@interface SpecialDetailCell ()

@property (nonatomic, strong) TallyView *playtimesView;
@property (nonatomic, strong) TallyView *durationView;
@property (nonatomic, strong) TallyView *commentsView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *downLoadBtn;
@property (nonatomic, strong) UILabel *createdAtLabel;

@end

@implementation SpecialDetailCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.titleLabel = [[UILabel alloc] init];
        self.titleLabel.numberOfLines = 0;
        self.titleLabel.font = [UIFont systemFontOfSize:14];
        [self.contentView addSubview:self.titleLabel];
        
        _playtimesView = [TallyView tallyViewWithImageName:@"iconfont-bofang"];
        [self.contentView addSubview:_playtimesView];
        _durationView = [TallyView tallyViewWithImageName:@"iconfont-biao"];
        [self.contentView addSubview:_durationView];
        _commentsView = [TallyView tallyViewWithImageName:@"iconfont-pinglun"];
        [self.contentView addSubview:_commentsView];
        self.createdAtLabel = [[UILabel alloc] init];
        self.createdAtLabel.textAlignment = NSTextAlignmentRight;
        self.createdAtLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:self.createdAtLabel];
        self.downLoadBtn = [UIButton buttonWithType:UIButtonTypeCustom];

        [self.downLoadBtn setBackgroundImage:[UIImage imageNamed:@"iconfont-xiazai"] forState:UIControlStateNormal];
        [self.downLoadBtn setBackgroundImage:[UIImage imageNamed:@"iconfont-fangxingwancheng"] forState:UIControlStateSelected];
        [self.downLoadBtn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchDown];
        [self.contentView addSubview:self.downLoadBtn];
    }
    return self;
}

- (void)click {
    self.downLoadBtn.selected = YES;
}

- (void)setModel:(SpecialTracksDetailModel *)model {
    _model = model;
   self.titleLabel.text = model.title;
    if (model.playtimes > 10000) {
        self.playtimesView.textLabel.text = [NSString stringWithFormat:@"%.1f万",model.playtimes/10000.0];
    }else {
        self.playtimesView.textLabel.text = [NSString stringWithFormat:@"%ld",model.playtimes];
    }

    self.durationView.textLabel.text =[NSString stringWithFormat:@"%02ld:%02ld",model.duration/60,model.duration%60];
    self.commentsView.textLabel.text = [NSString stringWithFormat:@"%ld",model.comments];

    NSInteger timeDifference = ((NSInteger)[[NSDate date] timeIntervalSince1970] - model.createdAt);

    if (timeDifference < 60 * 60 * 24 * 30) {
        self.createdAtLabel.text = [NSString stringWithFormat:@"%ld天前",timeDifference / (60 * 60 * 24)];

        return;
    }
    
    if (timeDifference < 60 * 60 * 24 * 30 * 12) {
        self.createdAtLabel.text = [NSString stringWithFormat:@"%ld个月前",timeDifference / (60 * 60 * 24 * 30) ];
        return;
    }
    self.createdAtLabel.text = [NSString stringWithFormat:@"%ld年前",timeDifference / (60 * 60 * 24 * 30 * 12) ];
    
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.titleLabel.frame = CGRectMake(20, 10, self.frame.size.width - 80, 20);
    [self.titleLabel sizeToFit];
    CGSize textSize = [self.titleLabel.text sizeWithFont:[UIFont systemFontOfSize:14] maxSize:CGSizeMake(self.frame.size.width - 80, MAXFLOAT)];
    
    CGFloat viewY = textSize.height + 30 ;
    _playtimesView.frame = CGRectMake(20, viewY, 50, 20);
    _durationView.frame = CGRectMake(CGRectGetMaxX(_playtimesView.frame), viewY, 50, 20);
    _commentsView.frame = CGRectMake(CGRectGetMaxX(_durationView.frame), viewY, 50, 20);

    self.downLoadBtn.frame = CGRectMake(self.frame.size.width - 40, viewY, 15, 15);
    self.createdAtLabel.frame = CGRectMake(self.frame.size.width - 60, 10, 50, 20);

}

@end
