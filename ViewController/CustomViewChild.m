//
//  CustomViewChild.m
//  Weather
//
//  Created by TaiND on 2/19/16.
//  Copyright (c) 2016 Amobi. All rights reserved.
//

#import "CustomViewChild.h"

@interface CustomViewChild()

@end

@implementation CustomViewChild

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)setup{
    [[NSBundle mainBundle] loadNibNamed:@"CustomViewChild" owner:self options:nil];
    [self addSubview:self.view];
    [self.view setBackgroundColor:[UIColor colorWithRed:0/255.0f green:0/255.0f blue:0/255.0f alpha:0.1f]];
    self.view.frame = self.bounds;
}
@end

