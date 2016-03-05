//
//  HomeSecondViewController.h
//  Weather
//
//  Created by TaiND on 2/19/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "BaseViewController.h"
#import "CustomViewChild.h"

@interface HomeSecondViewController : BaseViewController<UIGestureRecognizerDelegate>
@property (weak, nonatomic) IBOutlet UIView *viewContainVideo;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnails;
@property (weak, nonatomic) IBOutlet UIButton *btnPLay;


@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@property (nonatomic)  CustomViewChild *viewDayOne;
@property ( nonatomic)  CustomViewChild *viewDayTwo;
@property ( nonatomic)  CustomViewChild *viewDayThree;
@property ( nonatomic)  CustomViewChild *viewDayfour;
@property ( nonatomic)  CustomViewChild *viewDayfive;
@property ( nonatomic)  CustomViewChild *viewDaysix;
@property ( nonatomic)  CustomViewChild *viewDayseven;


@property (weak, nonatomic) NSString *videoIdentifier;
- (void) load:(NSString *)videoIdentifier;


@end
