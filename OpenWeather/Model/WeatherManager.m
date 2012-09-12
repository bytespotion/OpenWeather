//
//  WeatherManager.m
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/11/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import "WeatherManager.h"

@interface WeatherManager ()
{
    NSString *weatherCity;
    NSString *weatherCondition;
    NSUInteger weatherTemperature;
    NSUInteger weatherImageCode;
    NSString *weatherDescription;
    NSString *currentElement;
}

@property (nonatomic, retain) NSXMLParser *xmlParser;

@end

@implementation WeatherManager

@synthesize xml;
@synthesize weather = _weather;
@synthesize xmlParser;

- (id)init
{
    if (self = [super init]) {
        _weather = nil;
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    
    [xml release];
    [_weather release];
    
    xml = nil;
    _weather = nil;
    
}

- (void)dataRecivedFromWeatherService: (NSString *)newData
{
    xml = newData;
}

- (void)searchingWeatherInfoFailedWithError: (NSError *)error
{
    
}

- (void)setXml:(NSString *)newXml
{
    NSData *xmlData = [newXml dataUsingEncoding:NSUTF8StringEncoding];
    self.xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    self.xmlParser.delegate = self;
    
    if ([self.xmlParser parse]) {
        NSLog(@"New Xml parsed in Weather Manager");
    } else {
        NSLog(@"Error parsing Xml in Weather Manager");
        [_weather release];
        _weather = nil;
    }
}

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
    [_weather release];
    _weather = nil;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{
    
    if ([elementName isEqualToString:@"yweather:location"]) {
        weatherCity = [[attributeDict objectForKey:@"city"] retain];
    } else if ([elementName isEqualToString:@"yweather:condition"]){
        weatherCondition = [[attributeDict objectForKey:@"text"] retain];
        weatherTemperature = [[attributeDict objectForKey:@"temp"] integerValue];
        weatherImageCode = [[attributeDict objectForKey:@"code"] integerValue];
        
    } else {
        currentElement = [NSString stringWithString:elementName];
        NSLog(@"Current Element: %@", currentElement);
        if ([currentElement isEqualToString:@"description"])
            weatherDescription = nil;
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if ([currentElement isEqualToString:@"description"]) {
        if (weatherDescription == nil) {
            weatherDescription = [NSString stringWithString:string];
        } else {
            [weatherDescription stringByAppendingString:string];
        }
    }
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    _weather = [[Weather alloc] initWithCity:weatherCity temperature:weatherTemperature];
    _weather.condition = weatherCondition;
    _weather.image = weatherImageCode;
    _weather.description = weatherDescription;
    
    [weatherCity release];
    [weatherCondition release];
    [weatherDescription release];
    
    weatherCity = nil;
    weatherCondition = nil;
    weatherDescription = nil;
}

- (void)parser:(NSXMLParser *)parser validationErrorOccurred:(NSError *)validationError
{
    _weather = nil;
}

- (void)getImage:(UIImage **)image usingConnection:(id<WeatherImageConnectionDelegate>)connection
{
    if (_weather == nil) {
        *image = nil;
    } else {
        [connection loadImage:image withCode:_weather.image];
    }
}

@end
