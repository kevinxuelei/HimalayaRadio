//
//  BoZhuModel.m
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "BoZhuModel.h"
#import "BoZhuDetailModel.h"

@implementation BoZhuModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in self.list) {
            BoZhuDetailModel *model = [BoZhuDetailModel boZhuDetailModelWithDict:dic];
            [arr addObject:model];
        }
        self.list = arr;
    }
    return self;
}
+(instancetype)boZhuModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
