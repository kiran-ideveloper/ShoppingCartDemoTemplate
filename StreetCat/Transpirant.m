//
//  Transpirant.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 3/27/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "Transpirant.h"

@implementation Transpirant

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat BGLocations[2] = { 0.0, 1.0 };
    CGFloat BgComponents[8] = { 1, 1, 1 , 0.6,  // Start color
        0, 0, 0, 0.6 }; // Mid color and End color
    CGColorSpaceRef BgRGBColorspace = CGColorSpaceCreateDeviceRGB();
    CGGradientRef bgRadialGradient = CGGradientCreateWithColorComponents(BgRGBColorspace, BgComponents, BGLocations, 2);
    CGPoint startBg = CGPointMake(384, 300);
    CGPoint endBg = CGPointMake(384, 330);
    CGFloat endRadius= 600;
    CGContextDrawRadialGradient(ctx, bgRadialGradient, startBg, 0, endBg, endRadius, kCGGradientDrawsAfterEndLocation);
    CGColorSpaceRelease(BgRGBColorspace);
    CGGradientRelease(bgRadialGradient);
}


@end
