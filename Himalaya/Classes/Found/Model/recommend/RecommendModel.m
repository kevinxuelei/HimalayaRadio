//
//  RecommendModel.m
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "RecommendModel.h"
#import "EntrancesModel.h"
#import "HotRecommendsModel.h"
#import "SpecialColumnModel.h"
#import "DiscoveryColumnsModel.h"
#import "ListModel.h"
#import "FocusImagesModel.h"
#import "Enums.h"

@implementation RecommendModel

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

+ (instancetype)recommendModelWithDict:(NSDictionary *)dict {

    return [[self alloc] initWithDict:dict];
}

- (instancetype)initWithDict:(NSDictionary *)dict {
    self.dataArr = [NSMutableArray array];
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
        
        
        ListModel *editor = [ListModel listModelWithDict:self.editorRecommendAlbums];
        editor.species = CellTypeListModelCell;
        [self.dataArr addObject:editor];
        
        SpecialColumnModel *specialColumn = [SpecialColumnModel specialColumnModelWithDict:self.specialColumn];
        specialColumn.species = CellTypeSpecialColumnModelCell;
        [self.dataArr addObject:specialColumn];
        
        DiscoveryColumnsModel *discoveryColumns = [DiscoveryColumnsModel discoveryColumnsModelWithDict:self.discoveryColumns];
        discoveryColumns.species = CellTypeDiscoveryColumnsModelCell;
        [self.dataArr addObject:discoveryColumns];
        
        HotRecommendsModel *hotRecommends = [HotRecommendsModel hotRecommendsModelWithDict:self.hotRecommends];
        [self.dataArr addObjectsFromArray:hotRecommends.list];
        
        EntrancesModel *more = [[EntrancesModel alloc] init];

        more.species = CellTypeEntrancesModelCell;
        more.title = @"查看更多分类";
        [self.dataArr addObject:more];
        
        NSDictionary *entrancesDict = self.entrances[@"list"][0];
        EntrancesModel *entrances = [EntrancesModel entrancesModelWithDict:entrancesDict];
        entrances.species = CellTypeEntrancesModelCell;
        [self.dataArr addObject:entrances];
    }
    
    return self;
}

@end
