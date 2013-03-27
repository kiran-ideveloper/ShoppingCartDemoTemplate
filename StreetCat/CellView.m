//
//  CellView.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 3/25/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "CellView.h"
#import <QuartzCore/CALayer.h>

@implementation CellView

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
    
    self.layer.borderColor = [[UIColor grayColor] CGColor];
    self.layer.borderWidth = 2.0f;
    
    self.layer.masksToBounds = YES;
    self.layer.cornerRadius = 8.0f;
    
    CGContextRef currentContext = UIGraphicsGetCurrentContext();
    int numberOfLines = self.numberOfRows - 1;
    CGFloat cellHeight = self.frame.size.height / self.numberOfRows;
    
    for (int lines = 1; lines <= numberOfLines; lines++) {
        CGContextMoveToPoint(currentContext, 0, cellHeight * lines);
        CGContextAddLineToPoint(currentContext, self.frame.size.width, cellHeight * lines);
    }
    [[UIColor grayColor] set];
    CGContextSetLineWidth(currentContext, 1.0f);
    CGContextStrokePath(currentContext);
}


@end
