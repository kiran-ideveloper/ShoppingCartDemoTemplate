//
//  Synchronize.h
//  StreetCat
//
//  Created by Maitreya Tech 750 on 3/27/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellView.h"

@interface Synchronize : UIViewController

@property (strong, nonatomic) IBOutlet CellView *cellView;
@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;
@property (strong, nonatomic) IBOutlet UIImageView *check1;
@property (strong, nonatomic) IBOutlet UIImageView *check2;
@property (strong, nonatomic) IBOutlet UIImageView *check3;
@property (strong, nonatomic) IBOutlet UIImageView *check4;

@end
