//
//  WeatherImageConnectionMockup.m
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/12/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import "WeatherImageConnectionMockup.h"

@implementation WeatherImageConnectionMockup

- (void)loadImage:(UIImage **)image withCode:(NSUInteger)code
{
    *image = [UIImage imageWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"weatherImage" ofType:@"png"]];
}

@end
