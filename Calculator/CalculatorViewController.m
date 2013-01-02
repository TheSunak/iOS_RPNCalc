//
//  CalculatorViewController.m
//  Calculator
//
//  Created by Vishal Sunak on 12/29/12.
//  Copyright (c) 2012 Vishal Sunak. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

//Private stuff:
@interface CalculatorViewController()
@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if (!_brain) _brain = [[CalculatorBrain alloc]init];
    return _brain;
}


//This is a automatically created action with the control drag release
//When a button is pressed... it links up to this action
//It also contains the object when a new action is triggered
//Type is id, can be any type... but hard to manage... change it to
// to UIButton*
- (IBAction)digitPressed:(UIButton*)sender
{
    
    /*---------------SINGLE LINES NON-FACTORED--------------------
    //Send a message to sender to get the currentTitle from the sender
    NSString *digit = [sender currentTitle];
    
    //NSLog(@"Digit: %@", digit);
    
    //Create a local variable:
    //Calling the getter to the UILabel on the screen with a 0 default
    UILabel *myDisplay = self.display;
    
    //Gets the text... its a standard property... we're getting the text of the label now
    NSString *currentText = myDisplay.text;
    
    //Create a new string that changes the value of currentText by appending the string digit
    NSString *newText = [currentText stringByAppendingString:digit];
    
    //Use the setter now to set the UILabel
    myDisplay.text = newText;
    //---------------SINGLE LINES NON-FACTORED--------------------*/
    
    //Same as above, refactored into 1 big line:
    NSString *digit = [sender currentTitle];
    if (self.userIsInTheMiddleOfEnteringANumber)
    {
        self.display.text = [self.display.text stringByAppendingString:digit];

    }
    else if ([digit isEqualToString:@"Pi" ])
    {
        self.display.text = [NSString stringWithFormat:@"%g", 3.14];
    }
    else
    {
        self.display.text = digit;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    
        
    //Need a private property to know whether we are typing a new number or continuing
    //Right now it leads with 0
    
}
- (IBAction)operationPressed:(UIButton *)sender
{
    //convenience for the user"
    if (self.userIsInTheMiddleOfEnteringANumber) [self enterPressed];
    
    double result = [self.brain performOperation:sender.currentTitle];
    //Result as a string:
    NSString *resultString = [NSString stringWithFormat:@"%g", result];
    self.display.text = resultString;
    
    
}


- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userIsInTheMiddleOfEnteringANumber = NO;

    
}


@end
