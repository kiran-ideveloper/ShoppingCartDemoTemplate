//
//  ContainerViewController.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 3/19/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "ContainerViewController.h"
#import <QuartzCore/CALayer.h>


@interface ContainerViewController ()

@property (nonatomic, strong) NSArray *carImages;

@end

@implementation ContainerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) setUp
{
    self.carImages = [[NSArray alloc]initWithObjects:@"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg", @"5.jpg", @"6.jpg", @"7.jpg", @"8.jpg", @"9.jpg", @"10.jpg", @"11.jpg", @"12.jpg", @"1.jpg", @"2.jpg", @"3.jpg", @"4.jpg", @"5.jpg", @"6.jpg", @"7.jpg", @"8.jpg", @"9.jpg", @"10.jpg", @"11.jpg", @"12.jpg", nil];
    NSLog(@"setup...");
}

- (void) loadView
{
    NSLog(@"laod view");
    [self setUp];
    [super loadView];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.carousel.type = iCarouselTypeCoverFlow2;
    
    self.backgroundView.layer.cornerRadius = 20;
    
    NSLog(@"container view was loaded.....");
    
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark iCarousel

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    NSLog(@"count: %d",[self.carImages count]);
    return [self.carImages count];
    
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[self.carImages objectAtIndex:index]]];
    view.frame = CGRectMake(0, 0, 150, 100);
    return view;
}

- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
    
    [UIView transitionWithView:(UIView *)self.image duration:1.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        self.image.image =  [UIImage imageNamed:[self.carImages objectAtIndex:  carousel.currentItemIndex]];
                    } completion:nil];
}

- (IBAction)swipe_right:(UISwipeGestureRecognizer *)sender {
    [self.carousel scrollToItemAtIndex:self.carousel.currentItemIndex - 1 animated:YES];
}

- (IBAction)swipe_Left:(UISwipeGestureRecognizer *)sender {
    [self.carousel scrollToItemAtIndex:self.carousel.currentItemIndex + 1 animated:YES];
}

@end
