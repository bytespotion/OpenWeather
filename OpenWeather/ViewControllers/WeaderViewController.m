//
//  WeaderViewController.m
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/13/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import "WeaderViewController.h"
#import "CityWeatherViewController.h"

@interface WeaderViewController ()

@end

@implementation WeaderViewController
@synthesize scrollView;

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
    // TODO: Remove at ViewControllers Implementation.
    CityWeatherViewController *cvcTemp = [[CityWeatherViewController alloc] initWithNibName:@"CityWeatherViewController" bundle:nil];
    [self addChildViewController:cvcTemp];
    CGRect theFrame = CGRectMake(0.0f, 0.0f, 320.0f, 370.0f);
    
    cvcTemp.view.frame = theFrame;
    
    [self.scrollView addSubview:cvcTemp.view];
    
    [cvcTemp release];
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [scrollView release];
    [super dealloc];
}

- (IBAction)switchToCitySelection:(id)sender {
    
    [self.view removeFromSuperview];
}
@end
