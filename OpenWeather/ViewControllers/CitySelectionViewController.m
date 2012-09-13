//
//  CitySelectionViewController.m
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/13/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import "CitySelectionViewController.h"
#import "WeaderViewController.h"

@interface CitySelectionViewController ()
{
    WeaderViewController *weatherVC;
}
@end

@implementation CitySelectionViewController

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
    weatherVC = [[WeaderViewController alloc] initWithNibName:@"WeaderViewController" bundle:nil];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    [weatherVC release];
    weatherVC = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)switchToWeather:(id)sender {
    
    [self.view addSubview:weatherVC.view];
}
@end
