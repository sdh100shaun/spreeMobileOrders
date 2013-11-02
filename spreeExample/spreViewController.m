//
//  spreViewController.m
//  spreeExample
//
//  Created by Shaun Hare on 02/11/2013.
//  Copyright (c) 2013 Shaun Hare. All rights reserved.
//

#import "spreViewController.h"


@interface spreViewController ()

@end

@implementation spreViewController

@synthesize dataLabel = _dataLabel;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateLabel:) name:@"dataPopulated" object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)fetchOrder:(id)sender {
    
   spreDataModel *orderModel = [[spreDataModel alloc] init];
    

    [orderModel fetchOrder:6];
    
    
    

    
}
-(void) updateLabel:(NSNotification *)notif
{
    spreDataModel* dataModel = [notif object];
    
    NSLog(@"%@",dataModel.data);
 
       self.dataLabel.text =[dataModel.data objectForKey:@"parish"];
       
    }
    


@end
