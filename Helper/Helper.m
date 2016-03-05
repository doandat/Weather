//
//  Helper.m
//  Weather
//
//  Created by TaiND on 2/22/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "Helper.h"

@implementation Helper
+(NSDateFormatter *)dateFormat{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd"];
    return dateFormat;
}
+(NSDateFormatter *)dateFormatShow{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MM-yyyy"];
    return dateFormat;
}

+ (MapIcon *)mapIconFromString:(NSString *)string{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init]; // here we create NSDateFormatter object for change the Format of date..
    [dateFormatter setDateFormat:@"dd-MM-yyyy HH-mm"]; //Here we can set the format which we need
    [dateFormatter setTimeZone: [NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
    [dateFormatter setTimeZone:[NSTimeZone localTimeZone]];
    NSString *convertedDateString = [dateFormatter stringFromDate:[NSDate date]];
//    NSLog(@"convertedDateString:%@",convertedDateString);
    NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour fromDate:[dateFormatter dateFromString:convertedDateString]];
//    NSLog(@"dateaaa:%i",[components hour]);
    NSInteger hourNow = [components hour];
    MapIcon *mapIcon = [[MapIcon alloc]init];
    if ([string isEqualToString:@"clear sky"]) {
        mapIcon.stringName = @"Quang mây";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"clearskyday";
        }else{
            mapIcon.stringIcon = @"clearskynight";
        }
    }else if ([string isEqualToString:@"few clouds"]) {
        mapIcon.stringName = @"Ít mây";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"fewcloudsday";
        }else{
            mapIcon.stringIcon = @"fewcloudsnight";
        }
    }else if ([string isEqualToString:@"scattered clouds"]) {
        mapIcon.stringName = @"Thưa mây";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"scatteredcloudsday";
        }else{
            mapIcon.stringIcon = @"scatteredcloudsnight";
        }
    }else if ([string isEqualToString:@"broken clouds"]) {
        mapIcon.stringName = @"Nhiều mây";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"brokencloudsday";
        }else{
            mapIcon.stringIcon = @"brokencloudsnight";
        }
    }else if ([string isEqualToString:@"shower rain"]) {
        mapIcon.stringName = @"Mưa to";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"showerrainday";
        }else{
            mapIcon.stringIcon = @"showerrainnight";
        }
    }else if ([string isEqualToString:@"heavy intensity rain"]) {
        mapIcon.stringName = @"Mưa to";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"showerrainday";
        }else{
            mapIcon.stringIcon = @"showerrainnight";
        }
    }else if ([string isEqualToString:@"rain"]) {
        mapIcon.stringName = @"Mưa vừa";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"rainday";
        }else{
            mapIcon.stringIcon = @"rainnight";
        }
    }else if ([string isEqualToString:@"moderate rain"]) {
        mapIcon.stringName = @"Mưa nhỏ";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"rainday";
        }else{
            mapIcon.stringIcon = @"rainnight";
        }
    }else if ([string isEqualToString:@"light rain"]) {
        mapIcon.stringName = @"Mưa nhỏ";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"rainday";
        }else{
            mapIcon.stringIcon = @"rainnight";
        }
    }else if ([string isEqualToString:@"thunderstorm"]) {
        mapIcon.stringName = @"Bão ";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"thunderstormday";
        }else{
            mapIcon.stringIcon = @"thunderstormnight";
        }
    }else if ([string isEqualToString:@"extreme rain"]) {
        mapIcon.stringName = @"Bão ";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"thunderstormday";
        }else{
            mapIcon.stringIcon = @"thunderstormnight";
        }
    }else if ([string isEqualToString:@"freezing rain"]) {
        mapIcon.stringName = @"Bão ";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"thunderstormday";
        }else{
            mapIcon.stringIcon = @"thunderstormnight";
        }
    }else if ([string isEqualToString:@"light intensity shower rain"]) {
        mapIcon.stringName = @"Bão ";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"thunderstormday";
        }else{
            mapIcon.stringIcon = @"thunderstormnight";
        }
    }else if ([string isEqualToString:@"heavy intensity shower rain"]) {
        mapIcon.stringName = @"Bão ";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"thunderstormday";
        }else{
            mapIcon.stringIcon = @"thunderstormnight";
        }
    }else if ([string isEqualToString:@"ragged shower rain"]) {
        mapIcon.stringName = @"Bão ";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"thunderstormday";
        }else{
            mapIcon.stringIcon = @"thunderstormnight";
        }
    }else if ([string isEqualToString:@"very heavy rain"]) {
        mapIcon.stringName = @"Mưa lớn";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"thunderstormday";
        }else{
            mapIcon.stringIcon = @"thunderstormnight";
        }
    }else if ([string isEqualToString:@"snow"]) {
        mapIcon.stringName = @"Tuyết";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"snowday";
        }else{
            mapIcon.stringIcon = @"snownight";
        }
    }else{
        mapIcon.stringName = @"Ít mây";
        if (hourNow < 17) {
            mapIcon.stringIcon = @"fewcloudsday";
        }else{
            mapIcon.stringIcon = @"fewcloudsnight";
        }
    }
    
    return mapIcon;
}
@end
