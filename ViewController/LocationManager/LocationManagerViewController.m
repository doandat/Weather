//
//  LocationManagerViewController.m
//  Weather
//
//  Created by TaiND on 2/23/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "LocationManagerViewController.h"
#import "ItemMangerLocationTableViewCell.h"
#import <Realm/Realm.h>
#import "CityDB.h"
#import "AddLocationViewController.h"
@interface LocationManagerViewController (){
    NSMutableArray *contentList;
}

@end

@implementation LocationManagerViewController
@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES];
//    contentList = self.arrCity;
    contentList = [[NSMutableArray alloc]init];
    [_btnBack addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"ItemMangerLocationTableViewCell" bundle:nil] forCellReuseIdentifier:@"ItemMangerLocationIdentifier"];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];

//    [self.btnAdd addTarget:self action:@selector(btnAdd) forControlEvents:UIControlEventTouchUpInside];
}

- (void) back{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)btnAdd:(id)sender {
    NSLog(@"btnAdd");
    AddLocationViewController *addLocation = [[AddLocationViewController alloc]initWithNibName:@"AddLocationViewController" bundle:nil];
    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:addLocation];
    [self.navigationController presentViewController:navi animated:YES completion:nil];
}
- (void)viewWillAppear:(BOOL)animated{
    NSLog(@"LocationManagerViewController");
    [contentList removeAllObjects];
    RLMResults *favoriteResult = [[CityDB allObjects] sortedResultsUsingProperty:@"cityId" ascending:NO];
    //    NSLog(@"RLMResults *home:%@",homeResult);
    for (CityDB *cityDB in favoriteResult) {
        City *itemtmp = [[City alloc]init];
        itemtmp.cityId = cityDB.cityId;
        itemtmp.cityName = cityDB.cityName;
        itemtmp.country = cityDB.country;
        itemtmp.latitude = cityDB.latitude;
        itemtmp.longitude = cityDB.longitude;
        [contentList addObject:itemtmp];
    }
    [self.tableView reloadData];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [contentList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ItemMangerLocationTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ItemMangerLocationIdentifier" forIndexPath:indexPath];
    cell.lbTitle.text = [(City *)[contentList objectAtIndex:indexPath.row] cityName];
    [cell.btnDel addTarget:self action:@selector(btnDel:) forControlEvents:UIControlEventTouchUpInside];
    [cell setBackgroundColor:nil];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:45/255.0f green:45/255.0f blue:45/255.0f alpha:1.0f];
    City *city = [contentList objectAtIndex:indexPath.row];
    [GlobalData sharedGlobalData].cityGlobal = city;
    NSLog(@"didSelectRowAtIndexPath:%@",[GlobalData sharedGlobalData].cityGlobal.cityName);
    [self back];
}


- (IBAction)btnADD:(id)sender {
    NSLog(@"btnAdd");
    AddLocationViewController *addLocation = [[AddLocationViewController alloc]initWithNibName:@"AddLocationViewController" bundle:nil];
//    UINavigationController *navi = [[UINavigationController alloc]initWithRootViewController:addLocation];
//    [self.navigationController presentViewController:navi animated:YES completion:nil];
    [self.navigationController pushViewController:addLocation animated:YES];

}

- (void) btnDel:(id)sender{
    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    if (indexPath != nil)
    {
        NSLog(@"indexPath:%@",indexPath);
        RLMRealm *realm = RLMRealm.defaultRealm;
        [realm beginWriteTransaction];
        CityDB *cityDB = [[CityDB alloc]init];
        cityDB.cityId =[NSString stringWithFormat:@"%@",[(City *)[contentList objectAtIndex:indexPath.row] cityId]];
        cityDB = [CityDB createOrUpdateInRealm:realm withValue:cityDB];
        [realm commitWriteTransaction];
        
        [realm beginWriteTransaction];
        [realm deleteObject:cityDB];
        [realm commitWriteTransaction];
        
        [contentList removeObjectAtIndex:indexPath.row];
        [self.tableView reloadData];

    }
}
@end
