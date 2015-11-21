//
//  SpecialTracksDetailModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SpecialTracksDetailModel : NSObject

@property (nonatomic, copy) NSString *downloadAacUrl;

@property (nonatomic, copy) NSString *playPathAacv164;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) NSInteger duration;

@property (nonatomic, assign) NSInteger createdAt;

@property (nonatomic, copy) NSString *coverSmall;

@property (nonatomic, assign) NSInteger comments;

@property (nonatomic, assign) NSInteger playtimes;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)specialTracksDetailModelWithDict:(NSDictionary *)dict;

@end
