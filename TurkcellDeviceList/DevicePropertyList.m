//
//  DevicePropertyList.m
//  TurkcellDeviceList
//
//  Created by ahmet on 08/07/15.
//  Copyright (c) 2015 ahmet. All rights reserved.
//

#import "DevicePropertyList.h"

@implementation DevicePropertyList

+(NSDictionary *)JSONKeyPathsByPropertyKey
{
    
    return @{
             @"key": @"key",
             @"value": @"value"
             };
    
}
@end
