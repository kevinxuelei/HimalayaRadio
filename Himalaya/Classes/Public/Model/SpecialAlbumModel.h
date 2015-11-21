//
//  SpecialAlbumModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SpecialAlbumModel : NSObject

//头部名称
@property (nonatomic, copy) NSString *title;
//专辑名称
@property (nonatomic, copy) NSString *coverSmall;
//昵称
@property (nonatomic, copy) NSString *nickname;
//头像
@property (nonatomic, copy) NSString *avatarPath;
//简介
@property (nonatomic, copy) NSString *intro;
//标签
@property (nonatomic, copy) NSString *tags;
//详细简介
@property (nonatomic, copy) NSString *introRich;
//观众人数
@property (nonatomic, copy) NSString *playTimes;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)specialAlbumModelWithDict:(NSDictionary *)dict;

@end
