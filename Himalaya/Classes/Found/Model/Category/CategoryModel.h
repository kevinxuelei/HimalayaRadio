//
//  CategoryModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/28.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CategoryModel : NSObject



@property (nonatomic, copy) NSString *coverPath;

@property (nonatomic, copy) NSString *title;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)categoryModelWithDict:(NSDictionary *)dict;

@end
