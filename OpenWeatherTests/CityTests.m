//
//  CityTests.m
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/11/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "City.h"

@interface CityTests : SenTestCase
{
    City *city;
}
@end

@implementation CityTests

- (void)setUp
{
    city = [[City alloc] initWithName:@"Barcelona" code:753692];
}

- (void)tearDown
{
    [city release];
    city = nil;
}


- (void)testCityExists
{
    STAssertNotNil(city, @"Should be able to create a city instance");
}

- (void)testCityHasName
{
    STAssertEqualObjects(city.name, @"Barcelona", @"A city must have a name");
}

- (void)testCitHasCode
{
    STAssertTrue(city.code == 753692, @"A city must have a code");
}

- (void)testCityIsNotEnabledByDefault
{
    STAssertFalse(city.enabled, @"A city is not enabled on creation");
}

- (void)testCityCanBeEnabled
{
    STAssertNoThrow(city.enabled = YES, @"A city should be able to be enabled");
}

@end
