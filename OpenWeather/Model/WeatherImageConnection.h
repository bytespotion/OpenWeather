//
//  WeatherImageConnection.h
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/12/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeatherImageConnectionDelegate.h"

@interface WeatherImageConnection : NSObject <WeatherImageConnectionDelegate>

- (void)loadImage:(UIImage **)image withCode:(NSUInteger)code;

@end
