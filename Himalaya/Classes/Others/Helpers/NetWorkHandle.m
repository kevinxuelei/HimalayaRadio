//
//  NetWorkHandle.m
//  NetWork
//
//  Created by 苗旭萌 on 15/10/5.
//  Copyright (c) 2015年 苗旭萌. All rights reserved.
//

#import "NetWorkHandle.h"

@implementation NetWorkHandle

+ (void)getDataWithURLString:(NSString *)string
                     compare:(MyBlock)block
{
    
    // 对地址做一次UTF－8的转码，防止参数里面有中文
    NSString *urlString = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (data != nil) {
            // 因为不确定数据的类型，所以用id 泛型指针去接收
            id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            
            block(object);
        }
    }];
}

+ (void)postDataWithURLString:(NSString *)string
                andBodyString:(NSString *)bodyString
                      compare:(MyBlock)block
{
    NSString *urlString = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString:urlString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    NSData *data = [bodyString dataUsingEncoding:NSUTF8StringEncoding];
    
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:data];
    
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        
        if (data != nil) {
            // 因为不确定数据的类型，所以用id 泛型指针去接收
            id object = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
            block(object);
        
        }
        
    }];
    
    
    
}

@end
