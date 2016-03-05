//
//  RootViewController.m
//  Weather
//
//  Created by TaiND on 2/17/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()<SWRevealViewControllerDelegate>

@end

@implementation RootViewController

@synthesize viewController = _viewController;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    HomeViewController *homeViewController = [[HomeViewController alloc] init];
    SideBarViewController *sidebarViewController = [[SideBarViewController alloc] init];
    
    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:homeViewController];
    UINavigationController *sidebarNavigationController = [[UINavigationController alloc] initWithRootViewController:sidebarViewController];
    
    SWRevealViewController *revealController = [[SWRevealViewController alloc] initWithRearViewController:sidebarNavigationController frontViewController:homeNavigationController];
    revealController.delegate = self;
    
    self.viewController = revealController;

    self.navigation = [[UINavigationController alloc]initWithRootViewController:self.viewController];
    [self.navigation setNavigationBarHidden:YES];
    
    
    CGRect frame = self.view.bounds;
    
    self.navigation.view.frame = frame;
//    self.navigation.view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    [self.view addSubview:self.navigation.view];
    [self addChildViewController:self.navigation];

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
