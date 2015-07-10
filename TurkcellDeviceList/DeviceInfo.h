//
//  DeviceInfo.h
//  TurkcellDeviceList
//
//  Created by ahmet on 08/07/15.
//  Copyright (c) 2015 ahmet. All rights reserved.
//

#import <Mantle/Mantle.h>
#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface DeviceInfo : MTLModel <MTLJSONSerializing>

@property (nonatomic, strong) NSString *deviceName;
@property (nonatomic, assign) NSNumber *techPoint;
@property (nonatomic, strong) NSString *imageDeviceURL;
@property (nonatomic, strong) NSString *urlPostfix;
@property (nonatomic, strong) NSString *brand;
@property (nonatomic, strong) id colors;
@property (nonatomic, strong) id image360;
@property (nonatomic, strong) NSArray *flags;
@property (nonatomic, assign) BOOL freeCargo;
@property (nonatomic, assign) NSNumber *totalAmount;
@property (nonatomic, strong) NSArray *propertyList;
@property (nonatomic, strong) NSMutableArray *propertyList2;

@end
