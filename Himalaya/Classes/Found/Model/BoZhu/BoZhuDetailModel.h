//
//  BoZhuDetailModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BoZhuDetailModel : NSObject

@property (nonatomic, copy) NSString *uid;

@property (nonatomic, copy) NSString *nickname;

@property (nonatomic, copy) NSString *smallLogo;

- (instancetype)initWithDict:(NSDictionary *)dict;

+ (instancetype)boZhuDetailModelWithDict:(NSDictionary *)dict;

@end
