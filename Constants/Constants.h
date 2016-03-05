//
//  Constants.h
//  Weather
//
//  Created by TaiND on 2/20/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <Foundation/Foundation.h>

//URL
#define URL_GET_CITY @"http://content.amobi.vn/api/thoitiet/city-id"
#define URL_GET_WEATHER_ONE_DAY @"http://content.amobi.vn/api/thoitiet/day?city_id="
#define URL_GET_WEATHER_SEVEN_DAY @"http://content.amobi.vn/api/thoitiet/week?city_id="
#define URL_GET_WEATHER_LOCATION @"http://content.amobi.vn/api/thoitiet/get-location?"
#define URL_GET_VIDEO @"http://content.amobi.vn/api/thoitiet/get-video"
#define URL_GET_VIDEO_MORE @"http://content.amobi.vn/api/thoitiet/get-video?nextpageToken="

@interface Constants : NSObject

@end
