//
//  ItemMangerLocationTableViewCell.m
//  Weather
//
//  Created by TaiND on 2/24/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "ItemMangerLocationTableViewCell.h"

@implementation ItemMangerLocationTableViewCell

- (void)awakeFromNib {
    // Initialization code
//    UIImage *image= [self imageWithImage:[UIImage imageNamed:@"MyImage"] scaledToSize:CGSizeMake(80, 80)];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //UIGraphicsBeginImageContext(newSize);
    // In next line, pass 0.0 to use the current device's pixel scaling factor (and thus account for Retina resolution).
    // Pass 1.0 to force exact pixel size.
    UIGraphicsBeginImageContextWithOptions(newSize, NO, 0.0);
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}
@end
