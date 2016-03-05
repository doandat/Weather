//
//  SideBarViewController.m
//  Weather
//
//  Created by TaiND on 2/17/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "SideBarViewController.h"
#import "ItemTableViewCell.h"
#import "AboutViewController.h"

@interface SideBarViewController ()<UITableViewDataSource,UITableViewDelegate>{
    NSMutableArray *arrMenu;
    NSMutableArray *arrIcon;
}

@end

@implementation SideBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self.navigationController setNavigationBarHidden:YES];
    arrMenu = [[NSMutableArray alloc]initWithObjects:@"Rate",@"Send Email",@"About Us", nil];
    arrIcon = [[NSMutableArray alloc]initWithObjects:@"Star-100",@"Email-100",@"Info-100", nil];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    [self.tableView registerNib:[UINib nibWithNibName:@"ItemTableViewCell" bundle:nil] forCellReuseIdentifier:@"ItemTableViewCellIndentifier"];

}
- (void) viewWillAppear:(BOOL)animated{
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return arrMenu.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"ItemTableViewCellIndentifier";
    ItemTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[ItemTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    [cell.lbTitle setText:[arrMenu objectAtIndex:indexPath.row]];
    [cell.imageview setImage:[UIImage imageNamed:[arrIcon objectAtIndex:indexPath.row]]];
//    cell.imageview.image = [cell.imageview.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
//    [cell.imageview setTintColor:[UIColor redColor]];
    [cell setBackgroundColor:nil];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = (UITableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor colorWithRed:45/255.0f green:45/255.0f blue:45/255.0f alpha:1.0f];

    if (indexPath.row == 1) {
        NSString *subject = @"";
        NSString *body = @"";
        NSString *address = @"doanvandat93@gmail.com";
        NSString *cc = @"";
        NSString *path = [NSString stringWithFormat:@"mailto:%@?cc=%@&subject=%@&body=%@", address, cc, subject, body];
        NSURL *url = [NSURL URLWithString:[path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
        [[UIApplication sharedApplication] openURL:url];
    }else if (indexPath.row == 2){
        AboutViewController *aboutVC = [[AboutViewController alloc]initWithNibName:@"AboutViewController" bundle:nil];
        UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:aboutVC];
        [self.navigationController presentViewController:navigation animated:YES completion:nil];
    }
}


-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 45)];
    /* Create custom view to display section header... */
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 30, 30)];
    
    [imageView setImage:[UIImage imageNamed:@"cloud-overcast-128"]];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(50, 5, tableView.frame.size.width, 30)];
    [label setTextColor:[UIColor whiteColor]];
//    [label setFont:[UIFont boldSystemFontOfSize:12]];
    [label setText:@"COOL WEATHER"];
    
    UIView *viewLine = [[UIView alloc]initWithFrame:CGRectMake(0, 44, self.screenWidth, 1)];
    [viewLine setBackgroundColor:[UIColor colorWithRed:255/255.0f green:255/255.0f blue:255/255.0f alpha:0.5f]];
    
    [view addSubview:label];
    [view addSubview:imageView];
    [view addSubview:viewLine];
//    [view setBackgroundColor:[UIColor colorWithRed:166/255.0 green:177/255.0 blue:186/255.0 alpha:1.0]]; //your background color...
    return view;
}


- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 45.0f;
}

@end
