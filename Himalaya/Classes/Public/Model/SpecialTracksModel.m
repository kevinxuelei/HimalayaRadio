//
//  SpecialTracksModel.m
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "SpecialTracksModel.h"
#import "SpecialTracksDetailModel.h"

@implementation SpecialTracksModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *array = [NSMutableArray array];
        
        for (NSDictionary *dict in self.list) {
            SpecialTracksDetailModel *model = [SpecialTracksDetailModel specialTracksDetailModelWithDict:dict];
            [array addObject:model];
        }
        self.list = array;
    }
    return self;
}
+(instancetype)specialTracksModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
