//
//  Login.h
//  StreetCat
//
//  Created by Maitreya Tech 750 on 3/25/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellView.h"

@interface Login : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet CellView *formBackground;
@property (strong, nonatomic) IBOutlet UINavigationItem *loginNavigationItem;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)login:(UIButton *)sender;
- (IBAction)forgotPassword:(UIButton *)sender;

@end
