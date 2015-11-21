//
//  specialColumnModel.m
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "SpecialColumnModel.h"
#import "SpecialColumnDetailModel.h"

@implementation SpecialColumnModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in self.list) {
            SpecialColumnDetailModel *model = [SpecialColumnDetailModel specialColumnDetailModelWithDict:dic];
            [arr addObject:model];
        }
        self.list = arr;
    }
    return self;
}
+(instancetype)specialColumnModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
