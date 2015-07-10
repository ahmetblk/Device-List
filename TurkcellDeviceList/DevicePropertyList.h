//
//  DevicePropertyList.h
//  TurkcellDeviceList
//
//  Created by ahmet on 08/07/15.
//  Copyright (c) 2015 ahmet. All rights reserved.
//

#import "MTLModel.h"
#import "MTLJSONAdapter.h"

@interface DevicePropertyList : MTLModel <MTLJSONSerializing>

@property(nonatomic, strong) NSString *key;
@property(nonatomic, strong) NSString *value;

@end
