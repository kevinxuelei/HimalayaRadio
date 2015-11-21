//
//  TallyView.h
//  Himalaya
//
//  Created by lanou3g on 15/10/30.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TallyView : UIView

+ (instancetype)tallyViewWithImageName:(NSString *)imageName;

@property (nonatomic, weak) UILabel *textLabel;

@end
