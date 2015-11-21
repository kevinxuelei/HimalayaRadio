//
//  RankingModel.m
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "RankingModel.h"
#import "FocusImagesModel.h"
#import "RankingListModel.h"
#import "Enums.h"

@implementation RankingModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dict];
        self.focusImagesArr = self.focusImages[@"list"];
        NSMutableArray *arr = [NSMutableArray array];
        for (NSDictionary *dic in self.focusImagesArr) {
            FocusImagesModel *model = [[FocusImagesModel alloc] init];
            [model setValuesForKeysWithDictionary:dic];
            [arr addObject:model];
        }
        self.focusImagesArr = arr;
        NSMutableArray *array = [NSMutableArray array];
        for (NSDictionary *dict in self.datas) {
            RankingListModel *model = [RankingListModel rankingListModelWithDict:dict];
            model.species = CellTypeSpecialColumnModelCell;
            [array addObject:model];
        }
        self.datas = array;
    }
    return self;
}
+(instancetype)rankingModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
