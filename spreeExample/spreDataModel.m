//
//  spreDataModel.m
//  spreeExample
//
//  Created by Shaun Hare on 02/11/2013.
//  Copyright (c) 2013 Shaun Hare. All rights reserved.
//

#import "spreDataModel.h"

@implementation spreDataModel
@synthesize data;

-(void)fetchOrder:(int)orderId
{
    
    NSString* url = [NSString stringWithFormat:@"http://kepn.nottingham.ac.uk/place/placeno/id/%d",orderId];
    
    [self fetchData:url];
    
    
    
}

-(void)fetchData:(NSString*)url
{
    
    
    if(url == nil)
    {
        NSLog(@"Error url cannot be null");
    }
    else
    {
        
        
        //using GCD to set as a background task
        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
            
            //code executed in the background
            NSDictionary* json = nil;
            NSError *e = nil;
            NSData* fetchedData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
            
            if (fetchedData) {
                json = [NSJSONSerialization
                        JSONObjectWithData:fetchedData
                        options:NSJSONReadingAllowFragments
                        error:&e];
            }
            
            
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                if (json) {
                    
                    data = json;
                    
                    if (data !=nil) {
                       
                        
                        [[NSNotificationCenter defaultCenter] postNotificationName:@"dataPopulated" object:self];
                    }
                    
                }
                else
                {
                    
                    NSLog(@"Error parsing JSON: %@", e);
                    
                }
                
                
                
                
                
            });
            
        });
        
    }
    
    
    
}

@end
