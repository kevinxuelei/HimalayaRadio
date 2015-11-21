//
//  hotRecommendsModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotRecommendsModel : UIView

@property (nonatomic, strong) NSMutableArray *list;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)hotRecommendsModelWithDict:(NSDictionary *)dict;

@end
