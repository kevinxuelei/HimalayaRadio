//
//  CategoryBtn.m
//  Himalaya
//
//  Created by lanou3g on 15/10/28.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "CategoryBtn.h"

@interface CategoryBtn ()
@property (nonatomic, strong)UIFont *myFont;
@end

@implementation CategoryBtn

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}

-(void)setup{
    //记录按钮标题的字体
    self.myFont = [UIFont systemFontOfSize:14];
    //设置标题的字体
    self.titleLabel.font = self.myFont;
    //设置按钮的图片显示的内容默认为居中
    self.imageView.contentMode = UIViewContentModeScaleToFill;
}
//设置title显示范围
- (CGRect)titleRectForContentRect:(CGRect)contentRect{
    NSString *title = self.currentTitle;
    CGSize maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    NSMutableDictionary *md = [NSMutableDictionary dictionary];
    //死循环 self.titleLabel需要调用当前方法
    md[NSFontAttributeName] = self.myFont;
    //计算文字的范围
    CGRect titleRect =  [title boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:md context:nil];
    CGFloat titleW = titleRect.size.width;
    
    return CGRectMake(self.frame.size.width / 2 - 20, 0,titleW , contentRect.size.height);
}
//设置img显示范围
- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    return CGRectMake(self.frame.size.width / 2 - 60, (self.frame.size.height - 20)/2, 20, 20);
}

@end