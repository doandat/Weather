//
//  ServiceGetDataFromUrl.m
//  Weather
//
//  Created by TaiND on 2/20/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "ServiceGetDataFromUrl.h"
#import "City.h"

@implementation ServiceGetDataFromUrl

+(NSDictionary*)getJSONFromUrlString:(NSString *)urlString {
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:urlString] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:15];
    [request setHTTPMethod:@"GET"];
    NSURLResponse *response;
    NSError *err = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
    
    if (err) {
        //NSLog(@"error: %@", err);
        return nil;
    }
    
    NSDictionary *JSON = [NSJSONSerialization JSONObjectWithData:data options: NSJSONReadingMutableContainers error: &err];
    if (err) {
        //NSLog(@"error: %@", err);
        return nil;
    }
    
    return JSON;
}

+(NSArray *)getCityInfo{
    NSMutableArray *arrCity = [[NSMutableArray alloc]init];
    NSDictionary *dic1 = [self getJSONFromUrlString:URL_GET_CITY];
    if (dic1) {
        for (NSDictionary *dic in dic1) {
            NSDictionary *dicLocation = [dic objectForKey:@"coord"];
            City *city = [[City alloc]init];
            city.cityId = [dic objectForKey:@"_id"];
            city.cityName = [dic objectForKey:@"name"];
            city.country = [dic objectForKey:@"country"];
            city.latitude = [dicLocation objectForKey:@"lat"];
            city.longitude = [dicLocation objectForKey:@"lon"];
            [arrCity addObject:city];
        }
    }
    return arrCity;
}

+(WeatherDay *)getWeatherDayWithCityId:(NSString *)cityId{
    WeatherDay *weather = [[WeatherDay alloc]init];
    NSDictionary *dic2 = [self getJSONFromUrlString:[NSString stringWithFormat:@"%@%@",URL_GET_WEATHER_ONE_DAY,cityId]];
    for (NSDictionary *dic1 in dic2) {
//        NSLog(@"dic1:%@",[NSString stringWithFormat:@"%@%@",URL_GET_WEATHER_ONE_DAY,cityId]);
        weather.weatherDayId = [dic1 objectForKey:@"id"];
        weather.main = [dic1 objectForKey:@"main"];
        weather.description = [dic1 objectForKey:@"description"];
        weather.temp = [[dic1 objectForKey:@"temp"] integerValue]-273;
        weather.pressure = [dic1 objectForKey: @"pressure"];
        weather.humidity = [dic1 objectForKey: @"humidity"];
        weather.temp_min = [[dic1 objectForKey:@"temp_min"] integerValue]- 273;
        weather.temp_max = [[dic1 objectForKey: @"temp_max"] integerValue] - 273;
        weather.wind_speed = [dic1 objectForKey:@"wind_speed"];
        weather.date = [[Helper dateFormat] dateFromString:[dic1 objectForKey:@"date"]];
//        NSLog(@"weather.sunrise:%@",[dic1 objectForKey: @"sunrise"]);
//        NSLog(@"weather.sunset:%@",[dic1 objectForKey: @"sunset"]);
//        NSLog(@"weather.date:%@",[dateFormat stringFromDate:[dateFormat dateFromString:[dic1 objectForKey:@"date"]]]);
        weather.sunrise = [dic1 objectForKey: @"sunrise"];
        weather.sunset = [dic1 objectForKey:@"sunset"];
        weather.city_id = [dic1 objectForKey:@"city_id"];
        weather.city_name = [dic1 objectForKey:@"city_name"];
    }
    
    return weather;
}
+(NSArray *)getWeatherSevenDayWithCityId:(NSString *)cityId{
    NSMutableArray *arrWeather = [[NSMutableArray alloc]init];
    
    NSDictionary *dic2 = [self getJSONFromUrlString:[NSString stringWithFormat:@"%@%@",URL_GET_WEATHER_SEVEN_DAY,cityId]];
    for (NSDictionary *dic1 in dic2) {
        WeatherDay *weather = [[WeatherDay alloc]init];
        weather.weatherDayId = [dic1 objectForKey:@"id"];
        weather.main = [dic1 objectForKey:@"main"];
        weather.description = [dic1 objectForKey:@"description"];
        weather.temp = [[dic1 objectForKey:@"temp"] integerValue]-273;
        weather.pressure = [dic1 objectForKey: @"pressure"];
        weather.humidity = [dic1 objectForKey: @"humidity"];
        weather.temp_min = [[dic1 objectForKey:@"temp_min"] integerValue]- 273;
        weather.temp_max = [[dic1 objectForKey: @"temp_max"] integerValue] - 273;
        weather.wind_speed = [dic1 objectForKey:@"wind_speed"];
        weather.date = [[Helper dateFormat] dateFromString:[dic1 objectForKey:@"date"]];
        //        NSLog(@"weather.sunrise:%@",[dic1 objectForKey: @"sunrise"]);
        //        NSLog(@"weather.sunset:%@",[dic1 objectForKey: @"sunset"]);
        //        NSLog(@"weather.date:%@",[dateFormat stringFromDate:[dateFormat dateFromString:[dic1 objectForKey:@"date"]]]);
        weather.sunrise = [dic1 objectForKey: @"sunrise"];
        weather.sunset = [dic1 objectForKey:@"sunset"];
        weather.city_id = [dic1 objectForKey:@"city_id"];
        weather.city_name = [dic1 objectForKey:@"city_name"];
        [arrWeather addObject:weather];
    }
    NSSortDescriptor *dateDescriptor = [NSSortDescriptor
                                        sortDescriptorWithKey:@"date"
                                        ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:dateDescriptor];
    //                    NSArray *sortedEventArray = [arrDataSource sortedArrayUsingDescriptors:sortDescriptors];
    
    [arrWeather sortUsingDescriptors:sortDescriptors];
    return arrWeather;
}

+ (NSString *)getIdentifierVideoFromUrl{
    NSDictionary *dic2 = [self getJSONFromUrlString:URL_GET_VIDEO];
//    NSLog(@"getIdentifierVideoFromUrl:%@",dic2);

    for (NSDictionary *dic1 in dic2){
//        NSLog(@"Dic:%@",dic1);
        NSLog(@"getIdentifierVideoFromUrl:%@",[dic1 objectForKey:@"videoId"]);
        return [dic1 objectForKey:@"videoId"];
        
        break;
    }
    return @"";
}

@end
