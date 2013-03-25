//
//  Login.m
//  StreetCat
//
//  Created by Maitreya Tech 750 on 3/25/13.
//  Copyright (c) 2013 Maitreya Tech 750. All rights reserved.
//

#import "Login.h"

@interface Login ()

@end

@implementation Login

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
    self.formBackground.numberOfRows = 2;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)login:(UIButton *)sender {
    
    if ([self emailValidation]) {
        if ([self passwordValidation]) {
            NSLog(@"login in sucessfull...");
        }
        else
        {
            [self alertViewWithString:@"please enter valid password"];
        }
    }
    else
    {
        [self alertViewWithString:@"please enter valid emailId"];
    }
}

- (IBAction)forgotPassword:(UIButton *)sender {
    
}

#pragma mark -
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

#pragma mark -

- (void) alertViewWithString:(NSString *) alertMessage
{
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:nil message:alertMessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alert show];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.emailTextField resignFirstResponder];
    [self.passwordTextField resignFirstResponder];
}


@end
