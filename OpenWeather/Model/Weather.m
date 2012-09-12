//
//  Weather.m
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/10/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import "Weather.h"

@implementation Weather

@synthesize city = _city;
@synthesize temperature = _temperature;
@synthesize condition;
@synthesize image;
@synthesize description;

- (id)initWithCity:(NSString *)city temperature:(int)temperature
{
    if (self = [super init]) {
        _city = city;
        _temperature = temperature;
    }
    
    return self;
}

@end
