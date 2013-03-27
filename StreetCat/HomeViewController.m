//
//  HomeViewController.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 3/27/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(removeContainerView) name:@"removeContainer" object:nil];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) removeContainerView
{
    self.synchronizeContainer.hidden = YES;
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


@end
