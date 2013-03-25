//
//  ViewController.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 2/27/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "RegisterNewAccount.h"

@interface RegisterNewAccount ()

@end

@implementation RegisterNewAccount


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // customize backButtonItem of navigationBar.
    UIBarButtonItem *backButton = [[UIBarButtonItem alloc] initWithTitle:@"New to StreetCat" style:UIBarButtonItemStyleBordered target:nil action:nil];
    self.navigationItem.backBarButtonItem = backButton;
    
    
    self.RegistrationFormBackground.numberOfRows = 4;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)registration:(UIButton *)sender {
  
    // cheking email.
    if([self emailValidation]) {
        if ([self passwordValidation]) {
            if ([self nameValidation]) {
                NSLog(@"registration successfull...");
            }
            else
            {
                [self alertViewWithString:@"wrong name.."];
            }
        }
        else
        {
            [self alertViewWithString:@"please enter valid password.(1- upper, 1- lower, 1- number/symbol"];
        }
    }
    else
    {
        [self alertViewWithString:@"please enter valid emailID"];
    }
}


#pragma mark - validation

- (BOOL) emailValidation
{
    NSString *emailExpression = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";
    NSError *error = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:emailExpression options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *match = [regex firstMatchInString:self.emailTextField.text options:0 range:NSMakeRange(0, [self.emailTextField.text length])];
    if (match)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}


- (BOOL) passwordValidation
{
    NSString *passwordExpression = @"^(?!.*(.)\\1{3})((?=.*[\\d])(?=.*[a-z])(?=.*[A-Z])|(?=.*[a-z])(?=.*[A-Z])(?=.*[^\\w\\d\\s])|(?=.*[\\d])(?=.*[A-Z])(?=.*[^\\w\\d\\s])|(?=.*[\\d])(?=.*[a-z])(?=.*[^\\w\\d\\s])).{7,30}$";
    
    /*
     password: lower case, upper case, numbers, special characters, Additional checks:- No more than 3 repeating chars- 7-30 chars
     */
    NSError *error = NULL;
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:passwordExpression options:0 error:&error];
    NSTextCheckingResult *match = [regex firstMatchInString:self.passwordTextField.text options:0 range:NSMakeRange(0, [self.passwordTextField.text length])];
    if (match)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

- (BOOL) nameValidation
{
    NSString *nameExpression = @"[A-Z0-9a-z]{4,}$";
    NSError *error = NULL;
    
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:nameExpression options:NSRegularExpressionCaseInsensitive error:&error];
    NSTextCheckingResult *match = [regex firstMatchInString:self.nameTextField.text options:0 range:NSMakeRange(0, [self.nameTextField.text length])];
    if (match)
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

#pragma mark

- (void) alertViewWithString:(NSString *) alertMessage
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:alertMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
    [self.nameTextField resignFirstResponder];
    [self.companyTextField resignFirstResponder];
}

@end
