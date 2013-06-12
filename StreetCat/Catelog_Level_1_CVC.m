//
//  Catelog_Level_1_CVC.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 2/27/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "Catelog_Level_1_CVC.h"
#import "Catalog_Level_1_CVCell.h"
#import "ModalDataBase.h"
#import "Level2_CVC.h"

@interface Catelog_Level_1_CVC ()
{
    ModalDataBase *myModel;
}

@end

@implementation Catelog_Level_1_CVC

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
    return 25;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    Catalog_Level_1_CVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    if (indexPath.row % 2 == 0) {
        cell.catalogImage.image = [UIImage imageNamed:
                                   [[[myModel.catelog objectForKey:@"laptops"] objectForKey:@"Apple"] firstObject]];
    }
    else
    {
        cell.catalogImage.image = [UIImage imageNamed:
                                   [[[myModel.catelog objectForKey:@"mobiles"] objectForKey:@"iPhone"] firstObject]];
    }
   
    return cell;
}


- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 2 == 0)
    {
        myModel.selectedCatlog = @"laptops";
        myModel.selectedCatlogType = @"Apple";
    }
    else
    {
        myModel.selectedCatlog = @"mobiles";
        myModel.selectedCatlogType = @"iPhone";
    }
    return YES;
}


@end
