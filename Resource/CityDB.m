//
//  CityDB.m
//  Weather
//
//  Created by TaiND on 2/24/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "CityDB.h"

@implementation CityDB

+ (NSString *)primaryKey
{
    return @"cityId";
}

+ (NSArray *)indexedProperties {
    return @[@"cityId"];
}

@end
