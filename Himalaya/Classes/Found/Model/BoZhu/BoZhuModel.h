//
//  BoZhuModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BoZhuModel : NSObject

@property (nonatomic, assign) NSInteger species;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSMutableArray *list;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)boZhuModelWithDict:(NSDictionary *)dict;
@end
