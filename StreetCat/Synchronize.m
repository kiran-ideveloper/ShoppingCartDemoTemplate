//
//  Synchronize.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 3/27/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "Synchronize.h"
#import "ModalDataBase.h"


@interface Synchronize ()
{
    NSTimer *progressTimer;
}

@end

@implementation Synchronize

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
    
    
    // Adding Data to model.
    [self updateData];
    
    self.cellView.numberOfRows = 4;
    self.check1.hidden = YES;
    self.check2.hidden = YES;
    self.check3.hidden = YES;
    self.check4.hidden = YES;
    self.progressBar.progressImage = [UIImage imageNamed:@"progress.png"];
    progressTimer = [NSTimer scheduledTimerWithTimeInterval:0.04 target:self selector:@selector(moveProgress) userInfo:nil repeats:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) moveProgress
{
    if (self.progressBar.progress < 1.0) {
        self.progressBar.progress += 0.01;
        
        if (self.progressBar.progress > 0.2) {
            self.check1.hidden = NO;
        }
        if (self.progressBar.progress > 0.5) {
            self.check2.hidden = NO;
        }
        if (self.progressBar.progress > 0.7) {
            self.check3.hidden = NO;
        }
        if (self.progressBar.progress > 0.9) {
            self.check4.hidden = NO;
        }
    }
    else
    {
        [progressTimer invalidate];
        [self.view removeFromSuperview];
        [self removeFromParentViewController];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeContainer" object:nil];
    }
}


- (void) updateData
{
    
    NSMutableArray *itemApple = [[NSMutableArray alloc]initWithObjects:@"Apple1.jpg",
                                 @"Apple2.jpg",
                                 @"Apple3.jpg",
                                 @"Apple4.jpg",
                                 @"Apple5.jpg",
                                 @"Apple6.jpg",
                                 @"Apple7.jpg",
                                 @"Apple8.jpg",
                                 @"Apple9.jpg",
                                 @"Apple0.jpg",
                                 @"Apple11.jpg",
                                 @"Apple12.jpg",
                                 @"Apple13.jpg",
                                 @"Apple14.jpg", nil];
    
    NSMutableArray *itemDell = [[NSMutableArray alloc]initWithObjects:@"Dell1.jpg",
                                @"Dell2.jpg",
                                @"Dell3.jpg",
                                @"Dell4.jpg",
                                @"Dell5.jpg",
                                @"Dell6.jpg",
                                @"Dell7.jpg",
                                @"Dell8.jpg", nil];
    NSMutableArray *itemHP = [[NSMutableArray alloc]initWithObjects:@"HP1.jpg",
                              @"HP2.jpg",
                              @"HP3.jpg",
                              @"HP4.jpg",
                              @"HP5.jpg",
                              @"HP6.jpg",
                              @"HP7.jpg",
                              @"HP8.jpg",
                              @"HP9.jpg",
                              @"HP0.jpg",
                              @"HP11.jpg",
                              @"HP12.jpg",
                              @"HP13.jpg",
                              @"HP14.jpg", nil];
    
    NSMutableArray *itemToshiba = [[NSMutableArray alloc]initWithObjects:@"Toshiba1.jpg",
                                   @"Toshiba2.jpg",
                                   @"Toshiba3.jpg",
                                   @"Toshiba4.jpg",
                                   @"Toshiba5.jpg",
                                   @"Toshiba6.jpg",
                                   @"Toshiba7.jpg",
                                   @"Toshiba8.jpg",
                                   @"Toshiba9.jpg",
                                   @"Toshiba0.jpg",
                                   @"Toshiba11.jpg",
                                   @"Toshiba12.jpg",
                                   @"Toshiba13.jpg",
                                   @"Toshiba14.jpg", nil];
    
    
    NSMutableDictionary *categorieTypeLaptops =  [[NSMutableDictionary alloc]initWithObjectsAndKeys:itemApple, @"Apple", itemDell, @"Dell", itemHP, @"HP", itemToshiba, @"Toshiba", nil];
    
    NSMutableArray *itemiPhone = [[NSMutableArray alloc]initWithObjects:@"iPhone1.jpg",
                                  @"iPhone2.jpg",
                                  @"iPhone3.jpg",
                                  @"iPhone4.jpg",
                                  @"iPhone5.jpg",
                                  @"iPhone6.jpg",
                                  @"iPhone7.jpg",
                                  @"iPhone8.jpg",
                                  @"iPhone9.jpg",
                                  @"iPhone0.jpg",
                                  @"iPhone11.jpg", nil];
    
    NSMutableArray *itemAnriod = [[NSMutableArray alloc]initWithObjects:@"Anroid1.jpg",
                                  @"Anroid2.jpg",
                                  @"Anroid3.jpg",
                                  @"Anroid4.jpg",
                                  @"Anroid5.jpg",
                                  @"Anroid6.jpg",
                                  @"Anroid7.jpg",
                                  @"Anroid8.jpg",
                                  @"Anroid9.jpg",
                                  @"Anroid0.jpg",
                                  @"Anroid11.jpg",
                                  @"Anroid12.jpg",
                                  @"Anroid13.jpg",
                                  @"Anroid14.jpg",
                                  @"Anroid15.jpg",
                                  @"Anroid16.jpg",
                                  @"Anroid17.jpg", nil];
    NSMutableArray *itemWindowsMobile = [[NSMutableArray alloc]initWithObjects:@"WindowsMobile1.jpg",
                                         @"WindowsMobile2.jpg",
                                         @"WindowsMobile3.jpg",
                                         @"WindowsMobile4.jpg",
                                         @"WindowsMobile5.jpg",
                                         @"WindowsMobile6.jpg",
                                         @"WindowsMobile7.jpg",
                                         @"WindowsMobile8.jpg",
                                         @"WindowsMobile9.jpg",
                                         @"WindowsMobile0.jpg",
                                         @"WindowsMobile11.jpg",
                                         @"WindowsMobile12.jpg",
                                         @"WindowsMobile13.jpg",
                                         @"WindowsMobile14.jpg", nil];
    
    NSMutableDictionary *catelogItemMobiles = [[NSMutableDictionary alloc]initWithObjectsAndKeys:itemAnriod, @"Anriod", itemiPhone, @"iPhone", itemWindowsMobile, @"WindowsMobile", nil];
    
    ModalDataBase *myModel = [ModalDataBase sharedModel];
 
    myModel.catelog = [[NSMutableDictionary alloc]initWithObjectsAndKeys:categorieTypeLaptops, @"laptops", catelogItemMobiles, @"mobiles", nil];
}

@end
