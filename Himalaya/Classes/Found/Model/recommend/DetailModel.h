//
//  discoveryColumnsDetailModel.h
//  Himalaya
//
//  Created by lanou3g on 15/10/27.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailModel : UIView
//http://mobile.ximalaya.com/mobile/others/ca/album/track/364178/true/1/20?position=1&albumId=364178&isAsc=true&device=android&title=%25E5%25B0%258F%25E7%25BC%2596%25E6%258E%25A8%25E8%258D%2590&pageSize=20
@property (nonatomic, copy) NSString *albumId;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *trackTitle;

@property (nonatomic, copy) NSString *coverLarge;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)detailModelWithDict:(NSDictionary *)dict;

@end
