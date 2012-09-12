//
//  WeatherTests.m
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/10/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "Weather.h"

@interface WeatherTests : SenTestCase
{
    Weather *weather;
}
@end

@implementation WeatherTests

- (void)setUp
{
    weather = [[Weather alloc] initWithCity:@"Barcelona" temperature:23];
    weather.condition = @"sunny";
    weather.image = 0;
    weather.description = @"<br>Description<br>";
}

- (void)tearDown
{
    [weather release];
    weather = nil;
}

- (void)testWeatherExists
{
    STAssertNotNil(weather, @"Should be able to create weather instance");
}

- (void)testWeatherHasCity
{
    STAssertEqualObjects(weather.city, @"Barcelona", @"A weather forecast must be about a city");
}

- (void)testWeatherHasTemperature
{
    STAssertTrue(weather.temperature == 23, @"Weather needs to have a temperature");
}

- (void)testWeatherHasCondition
{
    STAssertEqualObjects(weather.condition, @"sunny", @"We need to know the weather condition");
}

- (void)testWeatherContainsDescription
{
    STAssertEqualObjects(weather.description, @"<br>Description<br>", @"A Description is needed");
}

@end
