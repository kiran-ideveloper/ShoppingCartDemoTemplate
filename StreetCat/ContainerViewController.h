//
//  ContainerViewController.h
//  StreetCat
//
//  Created by Maitreya Tech 750 on 3/19/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"

@interface ContainerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *image;
@property (strong, nonatomic) IBOutlet iCarousel *carousel;
@property (strong, nonatomic) IBOutlet UIView *backgroundView;
- (IBAction)swipe_right:(UISwipeGestureRecognizer *)sender;
- (IBAction)swipe_Left:(UISwipeGestureRecognizer *)sender;


@end
