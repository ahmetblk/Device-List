//
//  ViewController.m
//  TurkcellDeviceList
//
//  Created by ahmet on 08/07/15.
//  Copyright (c) 2015 ahmet. All rights reserved.
//

#import "ViewController.h"
#import "DeviceInfo.h"
#import "CustomCell.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>

@interface ViewController () <UITableViewDataSource, UITableViewDelegate>
{
    NSMutableData *webData;
    NSURLConnection *connection;
    NSArray *allDataDictionary;
}

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong) NSMutableArray *cells;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    AFHTTPRequestOperationManager *managerGet = [AFHTTPRequestOperationManager manager];
    [managerGet GET:@"http://intstb.tm.turkcell.com.tr/ccsishop/deviceList/akilli-telefonlar.json" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //NSLog(@"JSON:%@", responseObject);
        allDataDictionary = responseObject;
        
        self.cells =[[NSMutableArray alloc]init];
        
        
        for (NSDictionary *devices in allDataDictionary) {
            
            DeviceInfo *info = [MTLJSONAdapter modelOfClass:[DeviceInfo class] fromJSONDictionary:devices error:nil];
            
            CustomCell *cell = [[CustomCell alloc]initWithDevice:info];
            
            [self.cells addObject:cell];
            
            
        }
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
 }

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.cells.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    
    return self.cells[indexPath.row];
   
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.cells[indexPath.row] frame].size.height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

}

@end
