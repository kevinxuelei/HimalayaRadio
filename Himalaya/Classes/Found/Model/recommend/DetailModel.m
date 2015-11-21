
//
//  discoveryColumnsDetailModel.m
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "DetailModel.h"

@implementation DetailModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)detailModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
