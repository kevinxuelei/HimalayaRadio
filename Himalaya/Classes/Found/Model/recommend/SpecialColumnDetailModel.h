//
//  specialColumnDetailModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecialColumnDetailModel : UIView

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, copy) NSString *footnote;

@property (nonatomic, copy) NSString *coverPath;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)specialColumnDetailModelWithDict:(NSDictionary *)dict;

@end
