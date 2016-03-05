//
//  CityDidSelect.h
//  Weather
//
//  Created by TaiND on 2/25/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <Realm/Realm.h>

@interface CityDidSelect : RLMObject
@property NSString *cityId;
@property NSString *cityName;
@property NSString *country;
@property NSString *longitude;
@property NSString *latitude;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<CityDidSelect>
RLM_ARRAY_TYPE(CityDidSelect)
