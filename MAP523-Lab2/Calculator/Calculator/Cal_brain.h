//
//  Cal_brain.h
//  June4Example1
//  Copyright © 2020 SenecaCollege. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Cal_brain : NSObject
-(void)pushItem:(double)number;
-(double)calculate:(NSString*)opr;
@end

NS_ASSUME_NONNULL_END
