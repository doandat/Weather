//
//  HomeViewController.m
//  Weather
//
//  Created by TaiND on 2/17/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "HomeViewController.h"
#import "SWRevealViewController.h"
#import "HomeFirstViewController.h"
#import "HomeSecondViewController.h"

#import "ServiceGetDataFromUrl.h"
#import "City.h"
#import "WeatherDay.h"

#import "LocationManagerViewController.h"

#import <Realm/Realm.h>
#import "CityDidSelect.h"

@interface HomeViewController (){
    UILabel *lbHeader;
    UIScrollView *scrollView;
    HomeFirstViewController *homeFirstVC;
    HomeSecondViewController *homeSecondVC;
    NSArray *arrWeatherSevenDay;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view from its nib.
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.screenWidth, self.screenHeight)];
    [imageView setImage:[UIImage imageNamed:@"backgroud"]];
    [self.view addSubview:imageView];
    UIView *viewFull = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.screenWidth, self.screenHeight)];
    [viewFull setBackgroundColor:[UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.2f]];

    
    SWRevealViewController *revealController = [self revealViewController];
    
    [self.navigationController.navigationBar addGestureRecognizer:revealController.panGestureRecognizer];
    [viewFull addGestureRecognizer:revealController.panGestureRecognizer];
    
    UIView *viewHeader = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.screenWidth, 65)];
//    [viewHeader setBackgroundColor:[UIColor redColor]];
    [viewFull addSubview:viewHeader];
    [viewHeader setTintColor:[UIColor whiteColor]];
    UIButton *btnMenu = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    [btnMenu setFrame:CGRectMake(0, 20, 45, 45)];
    [btnMenu setImage:[UIImage imageNamed:@"menu"] forState:UIControlStateNormal];
//    [btnMenu setTintColor:[UIColor redColor]];
    [btnMenu addTarget:revealController action:@selector(revealToggle:) forControlEvents:UIControlEventTouchUpInside];
    [viewHeader addSubview:btnMenu];
    
    lbHeader = [[UILabel alloc]initWithFrame:CGRectMake(50, 30, self.screenWidth-100, 35)];
    [lbHeader setText:@"Ha Noi"];
    [lbHeader setTextColor:[UIColor whiteColor]];
    [lbHeader setTextAlignment:NSTextAlignmentCenter];
    [viewHeader addSubview:lbHeader];
    
    UIButton *btnLocation = [[UIButton alloc]initWithFrame:CGRectMake(self.screenWidth-50, 20, 45, 45)];
    [btnLocation setImage:[UIImage imageNamed:@"Marker"] forState:UIControlStateNormal];
    [btnLocation addTarget:self action:@selector(btnLocation) forControlEvents:UIControlEventTouchUpInside];
    btnLocation.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
    [viewHeader addSubview:btnLocation];
    
    UIView *viewLine = [[UIView alloc]initWithFrame:CGRectMake(10, 64, self.screenWidth-20, 1)];
    [viewLine setBackgroundColor:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.5f]];
    [viewHeader addSubview:viewLine];
    
    
    //setup view contain
    scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 65, self.screenWidth, self.screenHeight-65)];
    homeFirstVC = [[HomeFirstViewController alloc]initWithNibName:@"HomeFirstViewController" bundle:nil];
    [homeFirstVC.view setFrame:CGRectMake(0, self.screenHeight-320-75, self.screenWidth, 320)];
    [scrollView addSubview:homeFirstVC.view];
    
    homeSecondVC = [[HomeSecondViewController alloc]initWithNibName:@"HomeSecondViewController" bundle:nil];
    [homeSecondVC.view setFrame:CGRectMake(0, self.screenHeight-67, self.screenWidth, 430*self.screenWidth/414)];
    [scrollView addSubview:homeSecondVC.view];
    
    [scrollView setContentSize:CGSizeMake(self.screenWidth, self.screenHeight+450*self.screenWidth/414-67)];
    
    [viewFull addSubview:scrollView];
    [self.view addSubview:viewFull];
    
//    NSLog(@"%@",[ServiceGetDataFromUrl getCityInfo]);
    
//    City *city = [self.arrCity objectAtIndex:1];
//    NSLog(@"cityLon:%@",city.longitude);
//    NSLog(@"cityLon:%@",city.latitude);
//    NSLog(@"cityLon:%@",city.cityId);
//    NSLog(@"cityLon:%@",city.cityName);
//    NSLog(@"cityLon:%@",city.country);
    
}

- (void) viewWillAppear:(BOOL)animated{
    NSLog(@"viewWillAppear:%f",self.screenHeight);
    [lbHeader setText:[GlobalData sharedGlobalData].cityGlobal.cityName];
    
    arrWeatherSevenDay = [ServiceGetDataFromUrl getWeatherSevenDayWithCityId:[GlobalData sharedGlobalData].cityGlobal.cityId];
    
    
    
    WeatherDay *day = [ServiceGetDataFromUrl getWeatherDayWithCityId:[GlobalData sharedGlobalData].cityGlobal.cityId];
    NSLog(@"111:%@",day.weatherDayId);
    NSLog(@"111:%@",day.main);
    NSLog(@"111:%@",day.description);
    NSLog(@"111:%ld",(long)day.temp);
    NSLog(@"111:%@",day.pressure);
    NSLog(@"111:%@",day.humidity);
    //    NSLog(@"111:%ld",day.temp_min);
    //    NSLog(@"111:%ld",day.temp_max);
    NSLog(@"111:%@",day.wind_speed);
    NSLog(@"111:%@",[[Helper dateFormat] stringFromDate:day.date]);
    NSLog(@"sunrise:%@",day.sunrise);
    NSLog(@"sunset:%@",day.sunset);
    NSLog(@"111:%@",day.city_id);
    NSLog(@"111:%@",day.city_name);
    
    MapIcon *mapIcon = [Helper mapIconFromString:day.description];
    NSLog(@"mapIcon:%@:%@:%@",day.description,mapIcon.stringIcon,mapIcon.stringName);
    [homeFirstVC.iconWeather setImage:[UIImage imageNamed:mapIcon.stringIcon]];
    homeFirstVC.lbDescription.text = mapIcon.stringName;
    homeFirstVC.lbNhietDo.text = [NSString stringWithFormat:@"%ld",(long)day.temp];
//    homeFirstVC.lbNhietDo.text = @"69";
    
    homeFirstVC.lbWindSpeed.text =[NSString stringWithFormat:@"Gió: %@ km/h",day.wind_speed];
    homeFirstVC.lbHumidity.text = [NSString stringWithFormat:@"Độ ẩm: %@%%",day.humidity];
    
    [homeSecondVC.btnPLay addTarget:self action:@selector(playVideo) forControlEvents:UIControlEventTouchUpInside];
//    homeSecondVC.videoIdentifier = @"rx6gYTkSJzc";
    
    

    
    WeatherDay *dayOne = [arrWeatherSevenDay objectAtIndex:0];
    MapIcon *mapIcon1 = [Helper mapIconFromString:dayOne.description];

    homeSecondVC.viewDayOne.lbDay.text = [[Helper dateFormatShow] stringFromDate:dayOne.date];
    homeSecondVC.viewDayOne.lbNhietDo.text = [NSString stringWithFormat:@"N.Độ: %ld-%ld",(long)dayOne.temp_min,(long)dayOne.temp_max];
    homeSecondVC.viewDayOne.lbDes.text = mapIcon1.stringName;
    [homeSecondVC.viewDayOne.imgDes setImage:[UIImage imageNamed:mapIcon1.stringIcon]];

    
    
    WeatherDay *dayTwo = [arrWeatherSevenDay objectAtIndex:1];
    MapIcon *mapIcon2 = [Helper mapIconFromString:dayTwo.description];
    homeSecondVC.viewDayTwo.lbDay.text = [[Helper dateFormatShow] stringFromDate:dayTwo.date];
    homeSecondVC.viewDayTwo.lbNhietDo.text = [NSString stringWithFormat:@"N.Độ: %ld-%ld",(long)dayTwo.temp_min,(long)dayTwo.temp_max];
    homeSecondVC.viewDayTwo.lbDes.text = mapIcon2.stringName;
    [homeSecondVC.viewDayTwo.imgDes setImage:[UIImage imageNamed:mapIcon2.stringIcon]];
    
    
    WeatherDay *dayThree = [arrWeatherSevenDay objectAtIndex:2];
    MapIcon *mapIcon3 = [Helper mapIconFromString:dayThree.description];
//    homeSecondVC.view
    homeSecondVC.viewDayThree.lbDay.text = [[Helper dateFormatShow] stringFromDate:dayThree.date];
    homeSecondVC.viewDayThree.lbNhietDo.text = [NSString stringWithFormat:@"N.Độ: %ld-%ld",(long)dayThree.temp_min,(long)dayThree.temp_max];
    homeSecondVC.viewDayThree.lbDes.text = mapIcon3.stringName;
    [homeSecondVC.viewDayThree.imgDes setImage:[UIImage imageNamed:mapIcon3.stringIcon]];
    
    WeatherDay *dayFour = [arrWeatherSevenDay objectAtIndex:3];
    MapIcon *mapIcon4 = [Helper mapIconFromString:dayFour.description];
    //    homeSecondVC.view
    homeSecondVC.viewDayfour.lbDay.text = [[Helper dateFormatShow] stringFromDate:dayFour.date];
    homeSecondVC.viewDayfour.lbNhietDo.text = [NSString stringWithFormat:@"N.Độ: %ld-%ld",(long)dayFour.temp_min,(long)dayFour.temp_max];
    homeSecondVC.viewDayfour.lbDes.text = mapIcon4.stringName;
    [homeSecondVC.viewDayfour.imgDes setImage:[UIImage imageNamed:mapIcon4.stringIcon]];
    
    WeatherDay *dayFive = [arrWeatherSevenDay objectAtIndex:4];
    MapIcon *mapIcon5 = [Helper mapIconFromString:dayFive.description];
    //    homeSecondVC.view
    homeSecondVC.viewDayfive.lbDay.text = [[Helper dateFormatShow] stringFromDate:dayFive.date];
    homeSecondVC.viewDayfive.lbNhietDo.text = [NSString stringWithFormat:@"N.Độ: %ld-%ld",(long)dayFive.temp_min,(long)dayFive.temp_max];
    homeSecondVC.viewDayfive.lbDes.text = mapIcon5.stringName;
    [homeSecondVC.viewDayfive.imgDes setImage:[UIImage imageNamed:mapIcon5.stringIcon]];
    
    WeatherDay *daySix = [arrWeatherSevenDay objectAtIndex:5];
    MapIcon *mapIcon6 = [Helper mapIconFromString:daySix.description];
    //    homeSecondVC.view
    homeSecondVC.viewDaysix.lbDay.text = [[Helper dateFormatShow] stringFromDate:daySix.date];
    homeSecondVC.viewDaysix.lbNhietDo.text = [NSString stringWithFormat:@"N.Độ: %ld-%ld",(long)daySix.temp_min,(long)daySix.temp_max];
    homeSecondVC.viewDaysix.lbDes.text = mapIcon6.stringName;
    [homeSecondVC.viewDaysix.imgDes setImage:[UIImage imageNamed:mapIcon6.stringIcon]];
    
    
//    WeatherDay *daySeven = [arrWeatherSevenDay objectAtIndex:6];
//    MapIcon *mapIcon7 = [Helper mapIconFromString:daySeven.description];
//    //    homeSecondVC.view
//    homeSecondVC.viewDayseven.lbDay.text = [[Helper dateFormatShow] stringFromDate:daySeven.date];
//    homeSecondVC.viewDayseven.lbNhietDo.text = [NSString stringWithFormat:@"N.Độ: %ld-%ld",(long)daySeven.temp_min,(long)daySeven.temp_max];
//    homeSecondVC.viewDayseven.lbDes.text = mapIcon7.stringName;
//    [homeSecondVC.viewDayseven.imgDes setImage:[UIImage imageNamed:mapIcon7.stringIcon]];
    
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    RLMResults *cityDidSelectResult = [[CityDidSelect allObjects] sortedResultsUsingProperty:@"cityId" ascending:NO];
//    NSArray *arr = [CityDidSelect allObjects];
    for (CityDidSelect *cityDid in cityDidSelectResult) {
        [defaultRealm beginWriteTransaction];
        [defaultRealm deleteObject:cityDid];
        [defaultRealm commitWriteTransaction];
    }
   

    CityDidSelect *cityDidSelect = [[CityDidSelect alloc]init];
    cityDidSelect.cityId = [NSString stringWithFormat:@"%@",[GlobalData sharedGlobalData].cityGlobal.cityId];
    cityDidSelect.cityName =[NSString stringWithFormat:@"%@",[GlobalData sharedGlobalData].cityGlobal.cityName];
    cityDidSelect.country = [NSString stringWithFormat:@"%@",[GlobalData sharedGlobalData].cityGlobal.country];
    cityDidSelect.latitude =[NSString stringWithFormat:@"%@",[GlobalData sharedGlobalData].cityGlobal.latitude] ;
    cityDidSelect.longitude =[NSString stringWithFormat:@"%@", [GlobalData sharedGlobalData].cityGlobal.longitude];
    [defaultRealm beginWriteTransaction];
    [CityDidSelect createOrUpdateInRealm:defaultRealm withValue:cityDidSelect];
    [defaultRealm commitWriteTransaction];
}
- (void)viewDidAppear:(BOOL)animated{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) playVideo{
    [homeSecondVC load:@"rx6gYTkSJzc"];
}

-(void)btnLocation1{
//    AddLocationViewController *addLocation = [[AddLocationViewController alloc]initWithNibName:@"AddLocationViewController" bundle:nil];
//    UINavigationController *navigationLocation = [[UINavigationController alloc]initWithRootViewController:addLocation];
//    [self presentViewController:navigationLocation animated:YES completion:nil];
}

- (void) btnLocation{
    LocationManagerViewController *addLocation = [[LocationManagerViewController alloc]initWithNibName:@"LocationManagerViewController" bundle:nil];
    UINavigationController *navigationLocation = [[UINavigationController alloc]initWithRootViewController:addLocation];
    [self presentViewController:navigationLocation animated:YES completion:nil];
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
