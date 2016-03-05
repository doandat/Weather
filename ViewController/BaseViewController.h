//
//  BaseViewController.h
//  Weather
//
//  Created by TaiND on 2/17/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helper.h"
#import "City.h"
#import "GlobalData.h"
#import "MapIcon.h"

@interface BaseViewController : UIViewController

@property (nonatomic) CGFloat screenWidth;
@property (nonatomic) CGFloat screenHeight;
@property (nonatomic) NSArray *arrCity;

@property (nonatomic) City *cityShow;

@end
