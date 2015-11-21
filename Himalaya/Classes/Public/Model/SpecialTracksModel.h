//
//  SpecialTracksModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialTracksModel : NSObject

@property (nonatomic, strong) NSMutableArray *list;

@property (nonatomic, assign) NSInteger pageId;

@property (nonatomic, assign) NSInteger maxPageId;

@property (nonatomic, assign) NSInteger totalCount;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)specialTracksModelWithDict:(NSDictionary *)dict;

@end
