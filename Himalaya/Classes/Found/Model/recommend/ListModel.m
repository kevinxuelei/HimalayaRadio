
//
//  discoveryColumnsListModel.m
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "ListModel.h"
#import "DetailModel.h"

@implementation ListModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in self.list) {
            DetailModel *model = [DetailModel detailModelWithDict:dic];
            [arr addObject:model];
        }
        self.list = arr;
    }
    return self;
}
+(instancetype)listModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
