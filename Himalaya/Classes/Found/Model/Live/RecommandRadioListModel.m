//
//  recommandRadioListModel.m
//  Himalaya
//
//  Created by lanou3g on 15/10/29.
//  Copyright (c) 2015年 xhf06. All rights reserved.
//

#import "RecommandRadioListModel.h"

@implementation RecommandRadioListModel

- (NSMutableArray *)list {
    if (!_list) {
        _list = [NSMutableArray array];
    }
    return _list;
}

@end
