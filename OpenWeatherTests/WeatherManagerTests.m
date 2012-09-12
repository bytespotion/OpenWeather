//
//  WeatherManagerTests.m
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/11/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "WeatherManager.h"
#import "WeatherConnectionMockUp.h"
#import "WeatherImageConnectionMockUp.h"
#import "City.h"

@interface WeatherManagerTests : SenTestCase
{
    WeatherManager *weatherManager;
}
@end

@implementation WeatherManagerTests

- (void)setUp
{
    weatherManager = [[WeatherManager alloc] init];
    weatherManager.xml = [NSString stringWithContentsOfFile:[[NSBundle bundleForClass: [self class]] pathForResource:@"weatherResponse" ofType:@"xml"] encoding:NSUTF8StringEncoding error:nil];
}

- (void)tearDown
{
    [weatherManager release];
    weatherManager = nil;
}

- (void)testWeatherManagerIsUpdatedOnNewConnection
{
    City *city = [[City alloc] initWithName:@"Barcelona" code:753692];
    WeatherConnectionMockUp *weatherConnection = [[WeatherConnectionMockUp alloc] initWithCity:city delegate:weatherManager];
    STAssertEqualObjects(weatherManager.xml, @"Fake Response", @"xml response should be updated");
    [weatherConnection release];
    weatherConnection = nil;
}

- (void)testWeatherManagerFailsOnWrongResponse
{
    weatherManager.xml = @"Wrong file format";
    STAssertNil(weatherManager.weather, @"A wrong file format should not create a weather object");
}

- (void)testWeatherManagerCreatesGetsWeatherOnReceivingData
{
    STAssertNotNil(weatherManager.weather, @"Updating xml must instantiate a weather object");
}

- (void)testWeatherManagerProcessCity
{
    STAssertEqualObjects(weatherManager.weather.city, @"Barcelona", @"Should process file to get city name");
}

- (void)testWeatherManagerProcessTemperature
{
    STAssertTrue(weatherManager.weather.temperature == 26, @"Should process file to get temperature");
}

- (void)testWeatherManagerProcessCondition
{
    STAssertEqualObjects(weatherManager.weather.condition, @"Partly Cloudy", @"Should process file to get condition");
}

- (void)testWeatherManagerProcessImage
{
    STAssertTrue(weatherManager.weather.image == 29, @"Weather needs to have a valid image code");
}

- (void)testWeatherManagerProcessDescription
{
    STAssertEqualObjects(weatherManager.weather.description, @"Description data", @"Should process file to get description");
}

- (void)testWeatherReturnsNullImageOnNullWeather
{
    UIImage *image;
    WeatherImageConnectionMockup *wIConnection = [[WeatherImageConnectionMockup alloc] init];
    weatherManager.xml = @"Wrong file format";
    [weatherManager getImage:&image usingConnection:wIConnection];
    STAssertNil(image, @"A nil weather should return nil image");
    [wIConnection release];
}

- (void)testWeatherReturnsValidImage
{
    UIImage *image;
    UIImage *localImage = [UIImage imageWithContentsOfFile:[[NSBundle bundleForClass:[self class]] pathForResource:@"weatherImage" ofType:@"png"]];
    WeatherImageConnectionMockup *wIConnection = [[WeatherImageConnectionMockup alloc] init];
    [weatherManager getImage:&image usingConnection:wIConnection];
    STAssertEquals(image.size, localImage.size, @"A valid weather should return a valid image");
    [wIConnection release];
}



@end
