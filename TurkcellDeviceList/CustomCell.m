//
//  CustomCell.m
//  TurkcellDeviceList
//
//  Created by ahmet on 08/07/15.
//  Copyright (c) 2015 ahmet. All rights reserved.
//

#import "CustomCell.h"
#import "DeviceInfo.h"
#import "DevicePropertyList.h"

@implementation CustomCell

-(instancetype)initWithDevice:(DeviceInfo*)device
{
    self = [self init];
    if (self) {
        self.deviceName.text = device.deviceName;
        self.brand.text = device.brand;
        
      //NSLog(@"%@",device.brand);
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                       ^{
                           NSURL *imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://s.turkcell.com.tr%@",device.imageDeviceURL]];
                           NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                           
                           dispatch_sync(dispatch_get_main_queue(), ^{
                               
                               UIImage *Image = [UIImage imageWithData:imageData];
                               
                               self.imageDevice.image = Image;
                               
                               [self.imageDevice sizeToFit];
                          
                               self.constraintHeightImageView.constant = self.imageDevice.frame.size.height;
                             
                              // self.imageDevice.contentMode = UIViewContentModeScaleAspectFit;

                               [self setNeedsLayout];
                               [self layoutIfNeeded];
                               //[self.imageDevice sizeToFit];
                               
                           });
                       });

        int a = 0;
         CGRect frameView = self.labelView.frame;
        
    //    NSLog(@"frameView.origin.y %f",frameView.origin.y);
    //    NSLog(@"frameView.size.width %f",frameView.size.width);
        
        for (NSUInteger i = 0; i < device.propertyList.count; i++) {
            
        }
        
        CGFloat y = 0.0f;
        for (DevicePropertyList *property in device.propertyList)
       //     for (int i = 0; i < [device.propertyList count]; i++)
        {
        
            a++;
            
            UILabel *lbl1 = [[UILabel alloc]initWithFrame:CGRectMake(0, (40.0f*a), frameView.origin.y/2, 20.0f)];
            
            UILabel *lbl2 = [[UILabel alloc]initWithFrame:CGRectMake(frameView.origin.y/2, (40.0f*a), frameView.origin.y/2, 20.0f)];
            
            CGRect frame1 = [property.key boundingRectWithSize:CGSizeMake(frameView.origin.y/2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : lbl1.font} context:nil];
            
            CGRect frame2 = [property.value boundingRectWithSize:CGSizeMake(frameView.origin.y/2, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : lbl2.font} context:nil];
            
            
            CGRect frameLbl1 = lbl1.frame;
            frameLbl1.size.height=frame1.size.height;
            frameLbl1.origin.y = y;
            lbl1.frame = frameLbl1;
            
            CGRect frameLbl2 = lbl2.frame;
            frameLbl2.size.height=frame2.size.height;
            frameLbl2.origin.y = y;
            lbl2.frame = frameLbl2;
            
            lbl1.numberOfLines = 0;
            lbl2.numberOfLines = 0;

           lbl1.text =  property.key;
           lbl2.text =  property.value;
            
          //  NSLog(@"lbl1.bounds.size.width: %f lbl1.text: %@", lbl1.bounds.size.width, lbl1.text);
            /*
            if (frameLbl1.size.height > frameLbl2.size.height) {
                y = y + frameLbl1.size.height;
            }
            else {
                y = y + frameLbl2.size.height;
                
            }
            */
            y = y + ((frameLbl1.size.height > frameLbl2.size.height) ?  frameLbl1.size.height : frameLbl2.size.height);
            
            [self.labelView addSubview:lbl1];
            [self.labelView addSubview:lbl2];
            
        }
        
 //       CGRect frameView = self.labelView.frame;
//        frameView.size.height = (device.propertyList.count * 20.0f);
        self.constraintHeightView.constant = y;
 //       self.labelView.frame = frameView;
     
        //reload
        [self setNeedsLayout];
        [self layoutIfNeeded];
        
        CGRect frame = self.frame;
        frame.size.height = 364.0f + self.constraintHeightView.constant;//frameView.size.height;
        self.frame = frame;
        
    }

    return self;
}

-(instancetype)init
{
    self = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil].firstObject;
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
