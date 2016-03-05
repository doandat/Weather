//
//  City.h
//  Weather
//
//  Created by TaiND on 2/20/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (nonatomic) NSString *cityId;
@property (nonatomic) NSString *cityName;
@property (nonatomic) NSString *country;
@property (nonatomic) NSString *longitude;
@property (nonatomic) NSString *latitude;

@end
