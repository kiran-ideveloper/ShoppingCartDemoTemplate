//
//  ContainerViewController.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 3/19/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "ContainerViewController.h"
#import <QuartzCore/CALayer.h>
#import "ModalDataBase.h"
#import "ScrollCollectionViewController.h"

@interface ContainerViewController ()
{
    ModalDataBase *myModel;
    ScrollCollectionViewController *scrollCVC;
}

//@property (nonatomic, strong) NSArray *carImages;

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
    myModel =  [ModalDataBase sharedModel];
    scrollCVC = [[ScrollCollectionViewController alloc]init];
}

- (void) loadView
{
    [self setUp];
    [super loadView];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.carousel.type = iCarouselTypeCoverFlow2;
    self.backgroundView.layer.cornerRadius = 20;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma - mark iCarousel

- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [[myModel  allItems] count] - 1;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index reusingView:(UIView *)view
{
    view = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[[myModel allItems] objectAtIndex:index]]];
    view.frame = CGRectMake(0, 0, 150, 100);
    return view;
}

//- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
//{
//    NSIndexPath *myIndexPath = [NSIndexPath indexPathForRow:carousel.currentItemIndex inSection:0];
//    //[NSIndexPath indexPathForRow:carousel.currentItemIndex inSection:0]
//    
//    [scrollCVC.collectionView scrollToItemAtIndexPath:myIndexPath atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
//}

- (IBAction)swipe_right:(UISwipeGestureRecognizer *)sender {
    [self.carousel scrollToItemAtIndex:self.carousel.currentItemIndex - 1 animated:YES];
}

- (IBAction)swipe_Left:(UISwipeGestureRecognizer *)sender {
    [self.carousel scrollToItemAtIndex:self.carousel.currentItemIndex + 1 animated:YES];
}

@end
