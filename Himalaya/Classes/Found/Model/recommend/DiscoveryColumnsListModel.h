//
//  DiscoveryColumnsListModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/28.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DiscoveryColumnsListModel : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *coverPath;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)discoveryColumnsListModelWithDict:(NSDictionary *)dict;

@end
