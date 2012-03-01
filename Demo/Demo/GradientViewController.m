//
//  GradientViewController.m
//  Demo
//
//  Created by Julien Grimault on 1/3/12.
//  Copyright (c) 2012 julien.grimault@me.com. All rights reserved.
//

#import "GradientViewController.h"
#import "JGGradientView.h"

@interface GradientViewController ()

@end

@implementation GradientViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)loadView
{
  self.view = [[JGGradientView alloc] initWithFrame:CGRectZero
                                         startColor:[UIColor redColor]
                                           endColor:[UIColor blueColor]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
