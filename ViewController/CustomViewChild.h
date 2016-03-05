//
//  CustomViewChild.h
//  Weather
//
//  Created by TaiND on 2/19/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomViewChild : UIView

@property (nonatomic,strong) IBOutlet UIView *view;
@property (weak, nonatomic) IBOutlet UIImageView *imgDes;
@property (weak, nonatomic) IBOutlet UILabel *lbDay;
@property (weak, nonatomic) IBOutlet UILabel *lbNhietDo;
@property (weak, nonatomic) IBOutlet UILabel *lbDes;

@end
