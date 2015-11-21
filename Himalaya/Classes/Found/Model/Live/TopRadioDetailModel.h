//
//  topRadioDetailModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TopRadioDetailModel : NSObject

@property (nonatomic, copy) NSString *radioCoverLarge;

@property (nonatomic, copy) NSString *rname;

@property (nonatomic, assign) NSInteger radioPlayCount;

@property (nonatomic, copy) NSString *programName;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)topRadioDetailModelWithDict:(NSDictionary *)dict;


@end
