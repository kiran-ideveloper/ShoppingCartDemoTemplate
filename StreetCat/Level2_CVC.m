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
#import "ModalDataBase.h"



@class ThumbnailCollectionViewController;

@interface Level2_CVC ()
{
    ModalDataBase *myModel;
    //NSArray *catelogTypes;
}

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
    
    myModel = [ModalDataBase sharedModel];
    //   catelogTypes = [[NSArray alloc]init];
    
    //catelogTypes = [[myModel.catelog objectForKey:myModel.selectedCatlog] allKeys];
    
    UISearchBar *searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 0, 140, 40)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:searchBar];
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
    if (collectionView.tag == 11)
    {
        return  25;
    }
    else
    {
        return 30;
    }
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (collectionView.tag == 11) {
        // to repeat the total catelog types until the number of items.
        int myIndex = indexPath.row % [[myModel allTypes] count];
        
        Level2_CVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Level2CellIdentifier" forIndexPath:indexPath];
        NSString *requiredType =    [[myModel allTypes] objectAtIndex:myIndex];
        NSString *firstItem = [[myModel allItemsForKey:requiredType] firstObject];
        cell.imageView.image = [UIImage imageNamed:firstItem];
    
        return cell;
    }
    else
    {
        int myIndex = indexPath.row % ([[myModel allItems] count] - 1);
        
        ThumbnailCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"thumbnailCellIdentifier" forIndexPath:indexPath];
        NSString *itemName = [[myModel allItems] objectAtIndex:myIndex];
        cell.thumbnailImageView.image = [UIImage imageNamed:itemName];
        cell.layer.cornerRadius = 15.0;
        cell.thumbnailImageName.text = itemName;
        return cell;
    }
}

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag == 11) {
        int myIndex = indexPath.row % [[myModel allTypes] count];
        NSString *selectedCatelogType = [[myModel allTypes] objectAtIndex:myIndex];
        myModel.selectedCatlogType = selectedCatelogType;
        [self.ItemsCollectionView reloadData];
    }
    else
    {
        int myIndex = indexPath.row % ([[myModel allItems] count] - 1);
        NSString *itemName = [[myModel allItems] objectAtIndex:myIndex];
        myModel.selectedItem = itemName;
    }
    return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (collectionView.tag != 11) {
     
        UIViewController *contentVC = [[UIStoryboard storyboardWithName:@"MainStoryboard_iPad" bundle:nil] instantiateViewControllerWithIdentifier:@"ContainerID"];
        contentVC.view.frame = CGRectMake(0,
                                          self.ProductsCollectionView.frame.size.height + 3.0f,
                                          700,
                                          800);
        [self addChildViewController:contentVC];
        [self.view addSubview:contentVC.view];
    }
}




@end
