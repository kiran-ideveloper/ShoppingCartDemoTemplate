//
//  ViewController.h
//  StreetCat
//
//  Created by Maitreya Tech 750 on 2/27/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CellView.h"
@interface RegisterNewAccount : UIViewController <UITextFieldDelegate>

//@property (strong, nonatomic) IBOutlet UIImageView *RegistrationFormBackground;
@property (strong, nonatomic) IBOutlet CellView *RegistrationFormBackground;
@property (strong, nonatomic) IBOutlet UITextField *emailTextField;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *companyTextField;

- (IBAction)registration:(UIButton *)sender;

@end
