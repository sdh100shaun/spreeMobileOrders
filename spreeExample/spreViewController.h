//
//  spreViewController.h
//  spreeExample
//
//  Created by Shaun Hare on 02/11/2013.
//  Copyright (c) 2013 Shaun Hare. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "spreDataModel.h"

@interface spreViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *dataLabel;

- (IBAction)fetchOrder:(id)sender;

-(void) updateLabel:(NSDictionary*) data;
@end
