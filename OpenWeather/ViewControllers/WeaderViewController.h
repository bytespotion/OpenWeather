//
//  WeaderViewController.h
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/13/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WeaderViewController : UIViewController
@property (retain, nonatomic) IBOutlet UIScrollView *scrollView;

- (IBAction)switchToCitySelection:(id)sender;
@end
