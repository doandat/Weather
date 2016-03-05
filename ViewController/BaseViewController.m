//
//  BaseViewController.m
//  Weather
//
//  Created by TaiND on 2/17/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "BaseViewController.h"
#import "Constants.h"
#import "ServiceGetDataFromUrl.h"
#import <Realm/Realm.h>
#import "CityDidSelect.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.screenWidth = screenRect.size.width;
    self.screenHeight = screenRect.size.height;
    self.arrCity = [ServiceGetDataFromUrl getCityInfo];
    [GlobalData sharedGlobalData].cityGlobal = [self.arrCity objectAtIndex:0];
    RLMResults *favoriteResult = [[CityDidSelect allObjects] sortedResultsUsingProperty:@"cityId" ascending:NO];
    //    NSLog(@"RLMResults *home:%@",homeResult);
    City *city;
    for (CityDidSelect *cityDB in favoriteResult) {
        NSLog(@"Load DB cityDB:%@",cityDB.cityName);

        City *itemtmp = [[City alloc]init];
        itemtmp.cityId = cityDB.cityId;
        itemtmp.cityName = cityDB.cityName;
        itemtmp.country = cityDB.country;
        itemtmp.latitude = cityDB.latitude;
        itemtmp.longitude = cityDB.longitude;
        city = itemtmp;
    }
    if (city) {
        NSLog(@"Load DB");
        [GlobalData sharedGlobalData].cityGlobal = city;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
