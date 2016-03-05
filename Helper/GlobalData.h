//
//  GlobalData.h
//  Weather
//
//  Created by TaiND on 2/24/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "City.h"

@interface GlobalData : NSObject

@property (nonatomic) City *cityGlobal;

+ (GlobalData*)sharedGlobalData;

@end
