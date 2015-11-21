//
//  discoveryColumnsModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DiscoveryColumnsModel : UIView

@property (nonatomic, assign) NSInteger species;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSMutableArray *list;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)discoveryColumnsModelWithDict:(NSDictionary *)dict;

@end
