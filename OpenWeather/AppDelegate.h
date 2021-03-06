//
//  AppDelegate.h
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/10/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CitySelectionViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) CitySelectionViewController *viewController;

@end
