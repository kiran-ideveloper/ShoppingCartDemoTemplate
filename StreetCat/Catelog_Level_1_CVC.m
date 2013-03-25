//
//  Catelog_Level_1_CVC.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 2/27/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "Catelog_Level_1_CVC.h"
#import "Catalog_Level_1_CVCell.h"


@interface Catelog_Level_1_CVC ()

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
    return 40;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    
    Catalog_Level_1_CVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    cell.catalogImage.image = [UIImage imageNamed:@"CatalogLevel1.png"];
    return cell;
}

@end
