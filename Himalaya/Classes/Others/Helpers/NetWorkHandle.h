//
//  NetWorkHandle.h
//  NetWork
//
//  Created by 苗旭萌 on 15/10/5.
//  Copyright (c) 2015年 苗旭萌. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef void(^MyBlock)(id object);

@interface NetWorkHandle : NSObject


+ (void)getDataWithURLString:(NSString *)string compare:(MyBlock)block;

+ (void)postDataWithURLString:(NSString *)string
                andBodyString:(NSString *)bodyString
                      compare:(MyBlock)block;

@end
