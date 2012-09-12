//
//  WeatherConnectionMockUp.m
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/11/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import "WeatherConnectionMockUp.h"

@interface WeatherConnectionMockUp ()
{
    City *currentCity;
}
@end

@implementation WeatherConnectionMockUp

@synthesize delegate;

- (id)initWithCity:(City *)city delegate:(id <WeatherConnectionDelegate>) newDelegate;

{
    if (self = [super init]) {
        currentCity = [city retain];
        delegate = newDelegate;
        
        [delegate dataRecivedFromWeatherService:@"Fake Response"];
    }
    return self;
}
@end
