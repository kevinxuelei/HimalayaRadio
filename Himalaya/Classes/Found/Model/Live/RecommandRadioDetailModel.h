//
//  RecommandRadioDetailModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommandRadioDetailModel : NSObject

@property (nonatomic, copy) NSString *picPath;

@property (nonatomic, copy) NSString *rname;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)recommandRadioDetailModelWithDict:(NSDictionary *)dict;

@end
