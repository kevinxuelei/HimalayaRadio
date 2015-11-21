//
//  RankingListModel.m
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "RankingListModel.h"
#import "SpecialColumnDetailModel.h"

@implementation RankingListModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict in self.list) {
            SpecialColumnDetailModel *model = [SpecialColumnDetailModel specialColumnDetailModelWithDict:dict];
            model.subtitle = dict[@"firstKResults"][0][@"title"];
            model.footnote = dict[@"firstKResults"][1][@"title"];
            [array addObject:model];
        }
        self.list = array;
    }
    return self;
}
+(instancetype)rankingListModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
