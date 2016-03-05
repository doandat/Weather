//
//  WeatherDay.h
//  Weather
//
//  Created by TaiND on 2/20/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WeatherDay : NSObject

@property (nonatomic) NSString *weatherDayId;
@property (nonatomic) NSString *main;
@property (nonatomic) NSString *description;
@property (nonatomic) NSInteger temp;
@property (nonatomic) NSString *pressure;
@property (nonatomic) NSString *humidity;
@property (nonatomic) NSInteger temp_min;
@property (nonatomic) NSInteger temp_max;
@property (nonatomic) NSString *wind_speed;
@property (nonatomic) NSDate *date;
@property (nonatomic) NSString *sunrise;
@property (nonatomic) NSString *sunset;
@property (nonatomic) NSString *city_id;
@property (nonatomic) NSString *city_name;

@end
