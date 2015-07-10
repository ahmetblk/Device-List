//
//  DeviceInfo.m
//  TurkcellDeviceList
//
//  Created by ahmet on 08/07/15.
//  Copyright (c) 2015 ahmet. All rights reserved.
//

#import "DeviceInfo.h"
#import "DevicePropertyList.h"

@implementation DeviceInfo

+ (NSDictionary *)JSONKeyPathsByPropertyKey{
    return @{@"deviceName": @"title", @"imageDeviceURL": @"imageUrl" };
}


+ (NSValueTransformer *)propertyListJSONTransformer {
    return [NSValueTransformer mtl_JSONArrayTransformerWithModelClass:[DevicePropertyList class]];
}


@end
