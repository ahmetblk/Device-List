//
//  CustomCell.h
//  TurkcellDeviceList
//
//  Created by ahmet on 08/07/15.
//  Copyright (c) 2015 ahmet. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DeviceInfo;

@interface CustomCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *deviceName;
@property (weak, nonatomic) IBOutlet UILabel *brand;

@property (weak, nonatomic) IBOutlet UIImageView *imageDevice;
@property (weak, nonatomic) IBOutlet UIView *labelView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeightImageView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *constraintHeightView;

-(instancetype)initWithDevice:(DeviceInfo*)device;

@end
