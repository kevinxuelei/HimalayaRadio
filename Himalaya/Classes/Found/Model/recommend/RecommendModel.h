//
//  RecommendModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecommendModel : UIView
//热门直播
@property (nonatomic, strong) NSDictionary *entrances;
//发现新奇
@property (nonatomic, strong) NSDictionary *discoveryColumns;

//小编推荐
@property (nonatomic, strong) NSDictionary *editorRecommendAlbums;
//热门推荐
@property (nonatomic, strong) NSDictionary *hotRecommends;

//精品听单
@property (nonatomic, strong) NSDictionary *specialColumn;

//焦点图
@property (nonatomic, strong) NSDictionary *focusImages;

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) NSMutableArray *focusImagesArr;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)recommendModelWithDict:(NSDictionary *)dict;

@end
