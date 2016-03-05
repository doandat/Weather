//
//  RootViewController.h
//  Weather
//
//  Created by TaiND on 2/17/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"
#import "HomeViewController.h"
#import "SWRevealViewController.h"
#import "SideBarViewController.h"

@class SWRevealViewController;
@interface RootViewController : BaseViewController

@property (nonatomic, strong) UINavigationController *navigation;

@property (strong, nonatomic) SWRevealViewController *viewController;

@end
