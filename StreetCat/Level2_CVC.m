//
//  Level2_CVC.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 2/27/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "Level2_CVC.h"
#import "Level2_CVCell.h"
#import "ThumbnailCVCell.h"
#import <QuartzCore/CALayer.h>


@class ThumbnailCollectionViewController;

@interface Level2_CVC ()

@property (nonatomic, strong) ThumbnailCollectionViewController *tvc;

@end

@implementation Level2_CVC

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

    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 140, 40)];
  //  UIBarButtonItem *searchBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:searchBar];
    
 //   UIBarButtonItem *gridViewBarButttonItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonItemStylePlain target:self action:nil];
    
    
 //   searchBar.backgroundImage = [[[UIImage alloc] init] autorelease];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBar];
    
//    UIBarButtonItem *searchBarButton = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(searchButtonAction:)];
//    [[self navigationItem] setRightBarButtonItem:searchBarButton animated:YES];
    
//    UISearchBar *searchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, 120, 30)];
//    searchBar.autoresizingMask = UIViewAutoresizingFlexibleWidth;
//    searchBar.delegate = self;
//    UIView *searchBarView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 120, 30)];
//    searchBarView.autoresizingMask = 0;
//    [searchBarView addSubview:searchBar];
//    self.navigationItem.titleView = searchBarView;
    
     //  self.ThumbnailContainer
    
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
//    if (collectionView.tag == 1) {
//        return 20;
//    }
//    else
//    {
//        return 30;
//    }
    return 20;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (collectionView.tag == 11) {
        Level2_CVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Level2CellIdentifier" forIndexPath:indexPath];
        cell.imageView.image = [UIImage imageNamed:@"products.png"];
        return cell;
    }
    else
    {
        ThumbnailCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"thumbnailCellIdentifier" forIndexPath:indexPath];
        cell.thumbnailImageView.image = [UIImage imageNamed:@"Thumbnail.png"];
        cell.layer.cornerRadius = 15.0;
        cell.thumbnailImageName.text = @"name of product";
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == 22) {
        
        UIViewController *contentVC = [[UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil] instantiateViewControllerWithIdentifier:@"ContainerID"];
        contentVC.view.frame = CGRectMake(20, 175, 640, 785);
        [self addChildViewController:contentVC];
        [self.view addSubview:contentVC.view];
    }
}




@end
