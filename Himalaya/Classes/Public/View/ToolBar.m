//
//  ToolBar.m
//  Himalaya
//
//  Created by lanou3g on 15/10/26.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#define kButtomViewWidth 3
#define kBtnWidth self.frame.size.width / (self.subviews.count - 1)
#define kPicCount 6
#define kFrameH self.frame.size.height
#define kFrameW self.frame.size.width
#define kScrollViewH 170

#import "ToolBar.h"

@interface ToolBar ()

@property (nonatomic, weak) UIView *buttomView;

@property (nonatomic, strong) UIButton *lastBtn;

@property (nonatomic, strong) UIButton *btn;

@property (nonatomic, strong) NSMutableArray *btnArr;

@end

@implementation ToolBar

- (void)headerViewDidScroll:(CGFloat)X {
    self.buttomView.frame = CGRectMake(X / 5.0, self.buttomView.frame.origin.y, self.buttomView.frame.size.width, self.buttomView.frame.size.height);
    NSInteger index = X / self.frame.size.width;
    self.btn = self.btnArr[index];
    self.lastBtn.selected = NO;
    self.btn.selected = YES;
    self.lastBtn = self.btn;

}

- (UIButton *)btn {
    if (!_btn) {
        _btn = [[UIButton alloc] init];
    }
    return _btn;
}

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor redColor];
        [self addSubview:view];
        self.buttomView = view;
        
       
    }
    return self;
    
}

- (NSMutableArray *)btnArr {
    if (!_btnArr) {
        _btnArr = [NSMutableArray array];
    }
    return _btnArr;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    for (int i = 0; i < self.btnArr.count; i++) {
        UIButton *btn = self.btnArr[i];
        btn.tag = i;
        btn.frame = CGRectMake(kBtnWidth * i, 5, kBtnWidth, 20);
        if (0 == i) {
            btn.selected = YES;
            self.lastBtn = btn;
        }
    }
    self.buttomView.frame = CGRectMake(0, 30, kBtnWidth, kButtomViewWidth);
}

- (void)addItemWithName:(NSString *)name {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setTitle:name forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    btn.titleLabel.font = [UIFont systemFontOfSize:14];
    [btn addTarget:self action:@selector(selectedBtn:) forControlEvents:UIControlEventTouchDown];
    [self addSubview:btn];
    [self.btnArr addObject:btn];

}

- (void)selectedBtn:(UIButton *)btn {
    self.lastBtn.selected = NO;
    btn.selected = YES;
    self.lastBtn = btn;
    [UIView animateWithDuration:0.5 animations:^{
        self.buttomView.frame = CGRectMake(kBtnWidth * btn.tag, 30, kBtnWidth, kButtomViewWidth);
        self.block(btn.tag);
    }];
    
}


@end
