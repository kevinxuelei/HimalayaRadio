//
//  ToolBar.h
//  Himalaya
//
//  Created by lanou3g on 15/10/26.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BLOCK)(NSInteger index);

@interface ToolBar : UIView

@property (nonatomic, copy) BLOCK block;

- (void)addItemWithName:(NSString *)name;


- (void)headerViewDidScroll:(CGFloat)X;


@end
