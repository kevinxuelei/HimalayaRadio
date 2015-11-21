//
//  TallyView.m
//  Himalaya
//
//  Created by lanou3g on 15/10/30.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "TallyView.h"

@interface TallyView ()



@end

@implementation TallyView


+ (instancetype)tallyViewWithImageName:(NSString *)imageName {
    TallyView *view = [[self alloc] init];
    
    UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
    [view addSubview:imgView];
    imgView.frame = CGRectMake(0, 0, 10, 10);
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, 40, 10)];
    label.font = [UIFont systemFontOfSize:10];
    [view addSubview:label];
    view.textLabel = label;
    
    return view;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}


@end
