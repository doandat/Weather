//
//  CityDidSelect.m
//  Weather
//
//  Created by TaiND on 2/25/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "CityDidSelect.h"

@implementation CityDidSelect

+ (NSString *)primaryKey
{
    return @"cityId";
}

+ (NSArray *)indexedProperties {
    return @[@"cityId"];
}

@end
