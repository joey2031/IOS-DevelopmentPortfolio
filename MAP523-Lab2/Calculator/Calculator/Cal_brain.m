//
//  Cal_brain.m
//  June4Example1
//
//  Created by sat on 2020-06-04.
//  Copyright © 2020 SenecaCollege. All rights reserved.
//

#import "Cal_brain.h"
@interface Cal_brain()
@property (nonatomic)NSMutableArray * list;
@end

@implementation Cal_brain

-(NSMutableArray*)list{
    if(_list == nil){
        _list = [[NSMutableArray alloc]init];
    }
    return _list;
}
-(void)pushItem:(double)number{
    [self.list addObject:[NSNumber numberWithDouble:number]];
}
-(double)popItem{
    NSNumber *lastNumber = self.list.lastObject;
    [self.list removeLastObject];
    return lastNumber.doubleValue;
}
-(double)calculate:(NSString*)opr{
    double answer = 0.0;
    // Need to have []
    if([opr isEqualToString: @"+"]){
        // self is like the this keyword.
        answer = [self popItem] + [self popItem];
    }
    if([opr isEqualToString: @"-"]){
        answer = [self popItem] - [self popItem];
    }
    
    if([opr isEqualToString: @"*"]){
        answer = [self popItem] * [self popItem];
    }
    
    if([opr isEqualToString: @"/"]){
        answer = [self popItem] / [self popItem];
    }
    return answer;
}

@end

