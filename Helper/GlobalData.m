//
//  GlobalData.m
//  Weather
//
//  Created by TaiND on 2/24/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "GlobalData.h"

@implementation GlobalData
@synthesize cityGlobal;
static GlobalData *sharedGlobalData = nil;

+ (GlobalData*)sharedGlobalData{
    if (sharedGlobalData == nil) {
        sharedGlobalData = [[super allocWithZone:NULL] init];
        
        // Khởi tạo giá trị mặc định cho biến toàn cục
    }
    return sharedGlobalData;

}

@end
