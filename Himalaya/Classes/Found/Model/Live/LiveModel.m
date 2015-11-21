//
//  LiveModel.m
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "LiveModel.h"
#import "RecommandRadioListModel.h"
#import "TopRadioListModel.h"
#import "RecommandRadioDetailModel.h"
#import "TopRadioDetailModel.h"
#import "Enums.h"

@implementation LiveModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

-(instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
        self.dataArr = [NSMutableArray array];
        [self setValuesForKeysWithDictionary:dict];
        RecommandRadioListModel *recommand = [[RecommandRadioListModel alloc] init];
        recommand.title = @"推荐电台";
        recommand.species = CellTypeRecommandRadioListCell;
        for (NSDictionary *dict in self.recommandRadioList) {
            RecommandRadioDetailModel *recommandDetail = [RecommandRadioDetailModel recommandRadioDetailModelWithDict:dict];
            [recommand.list addObject:recommandDetail];
        }
        [self.dataArr addObject:recommand];
        TopRadioListModel *topRideo = [[TopRadioListModel alloc] init];
        topRideo.title = @"排行榜";
        topRideo.species = CellTypeTopRadioListModelCell;
        for (NSDictionary *dict in self.topRadioList) {
            TopRadioDetailModel *topRadioDetail = [TopRadioDetailModel topRadioDetailModelWithDict:dict];
            [topRideo.list addObject:topRadioDetail];
        }
        [self.dataArr addObject:topRideo];
    }
    return self;
}
+(instancetype)liveModelWithDict:(NSDictionary *)dict {
    return [[self alloc] initWithDict:dict];
}

@end
