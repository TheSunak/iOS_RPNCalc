//
//  CalculatorBrain.m
//  Calculator
//
//  Created by Vishal Sunak on 12/29/12.
//  Copyright (c) 2012 Vishal Sunak. All rights reserved.
//

#import "CalculatorBrain.h"

//Private methods:
@interface CalculatorBrain()
//This is the stack of the button pushes:
@property (nonatomic, strong) NSMutableArray *operandStack;
@end


@implementation CalculatorBrain


@synthesize operandStack = _operandStack;

//These are the synthesize methods:
- (NSMutableArray *)operandStack
{
    //Need to make sure that if its nil, it allocates the memory so on the stack its never nil
    if (_operandStack == nil)
    {
        _operandStack = [[NSMutableArray alloc] init];
    
    }
    
    return _operandStack;

}

- (void) setOperandStack:(NSMutableArray *)operandStack
{
    _operandStack = operandStack;
}

- (void)pushOperand:(double)operand
{
    //This pushes the operand onto the stack... but first has to convert
    //the operand into a NSNumber type in order to use a NSMutableArray array type
    [self.operandStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double)popOperand
{
    //Create a new OperandObject and set it equal to the last object
    NSNumber *operandObject = [self.operandStack lastObject];
    
    //Test if the array is empty... if it is not empty
    if (operandObject != nil)
    {
        //Get the last object from the operandStack
        [self.operandStack removeLastObject];
    }
    
    return [operandObject doubleValue];
}

    
- (double)performOperation: (NSString *) operation
{
    double result = 0;
    //Calculate result:
    
    if ([operation isEqualToString:@"+" ])
    {
        result = [self popOperand] + [self popOperand];
        
    }
    else if ([@"*" isEqualToString:operation])
    {
        result = [self popOperand] * [self popOperand];
        
    }
    
    else if ([@"-" isEqualToString:operation])
    {
        result = [self popOperand] - [self popOperand];
        
    }
    
    else if ([@"/" isEqualToString:operation])
    {
        result = [self popOperand] / [self popOperand];
        
    }
    
    else if ([@"sqrt" isEqualToString:operation])
    {
        result = sqrt([self popOperand]);
        
    }
    
    //ADD THE OTHER OPERATIONS:
    //PI
    //Sqrt
    
    [self pushOperand:result];
    return result;
}






@end
