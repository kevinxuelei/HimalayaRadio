//
//  discoveryColumnsModel.m
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "DiscoveryColumnsModel.h"
#import "DiscoveryColumnsListModel.h"

@implementation DiscoveryColumnsModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in self.list) {
            DiscoveryColumnsListModel *model = [DiscoveryColumnsListModel discoveryColumnsListModelWithDict:dic];
            [arr addObject:model];
        }
        self.list = arr;
    }
    return self;
}
+(instancetype)discoveryColumnsModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
