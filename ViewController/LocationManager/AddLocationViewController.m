//
//  AddLocationViewController.m
//  Weather
//
//  Created by TaiND on 2/23/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "AddLocationViewController.h"
#import "City.h"
#import <Realm/Realm.h>
#import "CityDB.h"

@interface AddLocationViewController (){
    NSArray *contentList;
    NSMutableArray *filteredContentList;
    BOOL isSearching;
}

@end

@implementation AddLocationViewController
@synthesize tableView = _tableView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES];
    contentList = self.arrCity;
    filteredContentList = [[NSMutableArray alloc] init];
    [_btnBack addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.searchBar.barTintColor = [UIColor colorWithRed:25/255.0f green:25/255.0f blue:25/255.0f alpha:1.0f];
//    self.searchBar.backgroundColor = [UIColor redColor];
//    [self.searchBar setSearchBarStyle:UISearchBarStyleMinimal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void) back{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    if (isSearching) {
        NSLog(@"isSearching numberOfRowsInSection");
        return [filteredContentList count];
    }
    else {
        return [contentList count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    cell.textLabel.textColor = [UIColor whiteColor];
    
    // Configure the cell...
    if (isSearching && [filteredContentList count]) {
        City *city = [filteredContentList objectAtIndex:indexPath.row];
        cell.textLabel.text = city.cityName;
    }
    else {
        City *city = [contentList objectAtIndex:indexPath.row];
        cell.textLabel.text = city.cityName;
    }
    [cell setBackgroundColor:nil];
    return cell;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:45/255.0f green:45/255.0f blue:45/255.0f alpha:1.0f];
    City *city;
    if (isSearching && [filteredContentList count]) {
        [GlobalData sharedGlobalData].cityGlobal = [filteredContentList objectAtIndex:indexPath.row];
        city =[filteredContentList objectAtIndex:indexPath.row];
    }else{
        [GlobalData sharedGlobalData].cityGlobal = [contentList objectAtIndex:indexPath.row];
        city =[contentList objectAtIndex:indexPath.row];
    }
    [GlobalData sharedGlobalData].cityGlobal = city;
    NSLog(@"didSelectRowAtIndexPath:%@",[GlobalData sharedGlobalData].cityGlobal.cityName);
    RLMRealm *defaultRealm = [RLMRealm defaultRealm];
    CityDB *cityDB = [[CityDB alloc]init];
    cityDB.cityId = [NSString stringWithFormat:@"%@",city.cityId];
    cityDB.cityName =[NSString stringWithFormat:@"%@",city.cityName];
    cityDB.country = [NSString stringWithFormat:@"%@",city.country];
    cityDB.latitude =[NSString stringWithFormat:@"%@",city.latitude] ;
    cityDB.longitude =[NSString stringWithFormat:@"%@", city.longitude];
    [defaultRealm beginWriteTransaction];
    [CityDB createOrUpdateInRealm:defaultRealm withValue:cityDB];
    [defaultRealm commitWriteTransaction];

    [self back];
}

- (void)searchTableList {
    NSString *searchString = _searchBar.text;
    NSLog(@"searchTableList:%@",searchString);
    for (City *cityTmp in contentList) {
        
        NSRange range = [cityTmp.cityName rangeOfString:searchString options:NSCaseInsensitiveSearch];
        if (range.location != NSNotFound) {
            [filteredContentList addObject:cityTmp];
        }
        
    }
}

- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"searchBarTextDidBeginEditing");
    isSearching = YES;
}

- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"Text change - %d",isSearching);
    
    //Remove all objects first.
    [filteredContentList removeAllObjects];
    
    if([searchText length] != 0) {
        isSearching = YES;
        [self searchTableList];
    }
    else {
        isSearching = NO;
        
    }
     [self.tableView reloadData];
}

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Cancel clicked");
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"Search Clicked");
    [self searchTableList];
}

@end
