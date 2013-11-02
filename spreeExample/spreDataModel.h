//
//  spreDataModel.h
//  spreeExample
//
//  Created by Shaun Hare on 02/11/2013.
//  Copyright (c) 2013 Shaun Hare. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "spreViewController.h"

@interface spreDataModel : NSObject
@property NSDictionary *data;
-(void)fetchOrder:(int)orderId;


@end
