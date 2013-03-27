//
//  Synchronize.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 3/27/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "Synchronize.h"

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

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view removeFromSuperview];
    [self removeFromParentViewController];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"removeContainer" object:nil];
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
//        [self.view removeFromSuperview];
//        [self removeFromParentViewController];
//        [[NSNotificationCenter defaultCenter] postNotificationName:@"removeContainer" object:nil];
    }
}


@end
