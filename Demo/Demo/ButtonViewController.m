//
//  ButtonViewController.m
//  Demo
//
//  Created by Julien Grimault on 1/3/12.
//  Copyright (c) 2012 julien.grimault@me.com. All rights reserved.
//

#import "ButtonViewController.h"

@interface ButtonViewController ()

@end

@implementation ButtonViewController
#pragma mark - Properties
@synthesize button1 = _button1;
@synthesize button2 = _button2;

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
  self.button1.color = [UIColor colorWithRed:0.18 green:0.47 blue:0.74 alpha:1.0];
  self.button2.color = [UIColor colorWithRed:0.88 green:0.23 blue:0.21 alpha:1.0];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
