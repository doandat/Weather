//
//  HomeFirstViewController.h
//  Weather
//
//  Created by TaiND on 2/18/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "BaseViewController.h"

@interface HomeFirstViewController : BaseViewController


@property (weak, nonatomic) IBOutlet UIImageView *iconWeather;
@property (weak, nonatomic) IBOutlet UILabel *lbNhietDo;
@property (weak, nonatomic) IBOutlet UILabel *lbDescription;
@property (weak, nonatomic) IBOutlet UILabel *lbWindSpeed;
@property (weak, nonatomic) IBOutlet UILabel *lbHumidity;

@end
