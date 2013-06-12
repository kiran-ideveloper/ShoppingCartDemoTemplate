//
//  ScrollCollectionViewController.h
//  StreetCat
//
//  Created by Maitreya Tech 750 on 03/04/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScrollCollectionViewController : UICollectionViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property (strong, nonatomic) IBOutlet UICollectionView *collectionView;

+ (void) scrollToIndex:(NSUInteger) index;


@end
