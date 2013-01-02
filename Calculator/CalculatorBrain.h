//
//  CalculatorBrain.h
//  Calculator
//
//  Created by Vishal Sunak on 12/29/12.
//  Copyright (c) 2012 Vishal Sunak. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

//Public APIs... they are the public methods that can be accessed:
- (void)pushOperand: (double)operand;
- (double)performOperation: (NSString *) operation;



@end
