//
//  LiveModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LiveModel : NSObject

@property (nonatomic, strong) NSMutableArray *recommandRadioList;

@property (nonatomic, strong) NSMutableArray *topRadioList;

@property (nonatomic, strong) NSMutableArray *dataArr;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)liveModelWithDict:(NSDictionary *)dict;

@end
