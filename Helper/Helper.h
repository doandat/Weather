//
//  Helper.h
//  Weather
//
//  Created by TaiND on 2/22/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MapIcon.h"
@interface Helper : NSObject

+(NSDateFormatter *)dateFormat;
+(NSDateFormatter *)dateFormatShow;

+ (MapIcon *)mapIconFromString:(NSString *)string;
@end
