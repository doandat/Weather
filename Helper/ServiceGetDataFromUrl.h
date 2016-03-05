//
//  ServiceGetDataFromUrl.h
//  Weather
//
//  Created by TaiND on 2/20/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "WeatherDay.h"
#import "Helper.h"

@interface ServiceGetDataFromUrl : NSObject

+ (NSDictionary*) getJSONFromUrlString:(NSString*)url;

+ (NSArray *)getCityInfo;
+ (WeatherDay *)getWeatherDayWithCityId:(NSString *)cityId;
+ (NSArray *)getWeatherSevenDayWithCityId:(NSString *)cityId;
+ (NSString *)getIdentifierVideoFromUrl;
@end
