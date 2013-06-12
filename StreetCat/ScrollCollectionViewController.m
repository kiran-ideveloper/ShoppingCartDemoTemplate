//
//  ScrollCollectionViewController.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 03/04/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "ScrollCollectionViewController.h"
#import "ScrollingCell.h"
#import "ModalDataBase.h"


@interface ScrollCollectionViewController ()
{
    ModalDataBase *myModel;
    
}

@end

@implementation ScrollCollectionViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    myModel = [ModalDataBase sharedModel];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma - mark UICollectionViewDataSource.

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [[myModel allItems] count] - 1;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    //int myIndex  = indexPath.row % ([[myModel allItems] count] - 1) ;
    ScrollingCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ScrollingCell" forIndexPath:indexPath];
    NSString *itemName = [[myModel allItems] objectAtIndex:indexPath.row];
    cell.imageView.image = [UIImage imageNamed:itemName];
    return cell;
}

- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    int myTarget = targetContentOffset->x;
    NSLog(@"%d", myTarget);
    targetContentOffset->x =  targetContentOffset->x - remainder(myTarget, 560);
    NSLog(@"offset:%f",targetContentOffset->x);
}


@end
