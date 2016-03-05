//
//  CityDB.h
//  Weather
//
//  Created by TaiND on 2/24/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <Realm/Realm.h>

@interface CityDB : RLMObject

@property NSString *cityId;
@property NSString *cityName;
@property NSString *country;
@property NSString *longitude;
@property NSString *latitude;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<CityDB>
RLM_ARRAY_TYPE(CityDB)
