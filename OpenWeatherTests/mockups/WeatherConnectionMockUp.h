//
//  WeatherConnectionMockUp.h
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/11/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherConnectionDelegate.h"
#import "City.h"


@interface WeatherConnectionMockUp : NSObject 

@property (assign) id <WeatherConnectionDelegate> delegate;

- (id)initWithCity:(City *)city delegate:(id <WeatherConnectionDelegate>) newDelegate;

@end
