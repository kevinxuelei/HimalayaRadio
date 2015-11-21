//
//  Advertisement.m
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#define kPicCount _array.count
#define kFrameH self.frame.size.height
#define kFrameW self.frame.size.width


#import "Advertisement.h"
#import <UIImageView+WebCache.h>
#import "FocusImagesModel.h"

@interface Advertisement ()<UIScrollViewDelegate>



@property (nonatomic, weak) UIScrollView *scrollView;

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, weak) UIPageControl *page;

@property (nonatomic, assign) NSInteger flag;

@end

@implementation Advertisement

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
    
    }
    return self;
}
-(void)addTimer{
    //添加一个定时器 每隔一定时间执行特定方法
    //参数:TimeInterval:时间间隔 target:监听对象 selector:方法名 repeats:是否重复
    self.timer = [NSTimer scheduledTimerWithTimeInterval:5.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //增加优先级 为了避免线程阻塞
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)setArray:(NSMutableArray *)array {
    _array = array;
    [self addTimer];
    [self addScrollView];
    [self addImgView];
    [self addPageControl];
    self.scrollView.frame = CGRectMake(0, 0, kFrameW, kScrollViewH);
    if (self.frame.size.height) {
        self.page.frame = CGRectMake(0, self.frame.size.height - 20, self.frame.size.width, 20);
    }else {
        [self.page removeFromSuperview];
    }

}

- (void)removeTimer
{
    //移除定时器 移除之后无法恢复
    [self.timer invalidate];
    self.timer = nil;
}


-(void)addScrollView{
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    [self addSubview:scrollView];
    self.scrollView = scrollView;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.delegate = self;
    self.scrollView.bounces = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentOffset = CGPointMake(kFrameW, 0);
    self.scrollView.contentSize = CGSizeMake((kPicCount - 1)* kFrameW, kScrollViewH);
}


- (void)addImgView {
    if (kPicCount) {
        for (int i = 0; i < 3; i++) {
            
            UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(kFrameW * i , 0, kFrameW, kScrollViewH)];
            NSString *name = [self.array[(i + _flag + kPicCount - 1)%kPicCount] pic];
            [imgView sd_setImageWithURL:[NSURL URLWithString:name]];
            [self.scrollView addSubview:imgView];
        }
    }
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (self.scrollView.contentOffset.x/kFrameW == 2) {
        _flag++;
        
    }
    
    if (self.scrollView.contentOffset.x/kFrameW == 0) {
        if (self.flag < 0) {
            self.flag += kPicCount;
        }
        _flag--;
        
    }
    
    [scrollView setContentOffset:CGPointMake(kFrameW, 0) animated:NO];

    self.page.currentPage = _flag % kPicCount;
    [self addImgView];
}

-(void)addPageControl{
    UIPageControl *page = [[UIPageControl alloc] init];
    page.numberOfPages = kPicCount;
    page.currentPage = kPicCount;
    [page addTarget:self action:@selector(pageOnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.page = page;
    [self addSubview:page];
}

-(void)pageOnClick:(UIPageControl *)page{
    
    [self.scrollView setContentOffset:CGPointMake(kFrameW * page.currentPage, 0) animated:YES];
}

- (void)nextImage
{
    [self scrollViewDidEndDecelerating:self.scrollView];
    CGPoint offset = CGPointMake(kFrameW * 2, 0);
    [self.scrollView setContentOffset:offset animated:YES];
    
}


- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    // 停止定时器(一旦定时器停止了,就不能再使用)
    [self removeTimer];
}


- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    // 开启定时器
    [self addTimer];
}

@end
