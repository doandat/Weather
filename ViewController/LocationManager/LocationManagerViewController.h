//
//  LocationManagerViewController.h
//  Weather
//
//  Created by TaiND on 2/23/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "BaseViewController.h"

@interface LocationManagerViewController : BaseViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *btnAdd;
- (IBAction)btnADD:(id)sender;

@end
