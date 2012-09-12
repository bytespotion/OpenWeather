//
//  WeatherManager.h
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/11/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherConnectionDelegate.h"
#import "WeatherImageConnectionDelegate.h"
#import "Weather.h"

@interface WeatherManager : NSObject <WeatherConnectionDelegate, NSXMLParserDelegate>

@property (nonatomic, retain) NSString *xml;
@property (readonly) Weather *weather;

- (void)getImage:(UIImage **)image usingConnection:(id<WeatherImageConnectionDelegate>)connection;

@end
