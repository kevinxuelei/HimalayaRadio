//
//  hotRecommendsModel.m
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "HotRecommendsModel.h"
#import "ListModel.h"
#import "Enums.h"

@implementation HotRecommendsModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in self.list) {
            ListModel *model = [ListModel listModelWithDict:dic];
            model.species = CellTypeListModelCell;
            [arr addObject:model];
        }
        self.list = arr;
    }
    return self;
}
+(instancetype)hotRecommendsModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
