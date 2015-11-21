//
//  RankingModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RankingModel : NSObject

@property (nonatomic, strong) NSArray *datas;

@property (nonatomic, strong) NSDictionary *focusImages;

@property (nonatomic, strong) NSMutableArray *focusImagesArr;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)rankingModelWithDict:(NSDictionary *)dict;

@end
