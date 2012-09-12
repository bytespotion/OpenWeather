//
//  WeatherImageConnection.m
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/12/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import "WeatherImageConnection.h"

@implementation WeatherImageConnection

- (void)loadImage:(UIImage **)image withCode:(NSUInteger)code
{
    *image = [[UIImage alloc] initWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://l.yimg.com/a/i/us/nws/weather/gr/%dd.png", code]]]];

}
@end
