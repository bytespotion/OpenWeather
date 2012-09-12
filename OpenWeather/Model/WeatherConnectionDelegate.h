//
//  WeatherConnectionDelegate.h
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/11/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol WeatherConnectionDelegate <NSObject>

/**
 * Signal from Connection Object that new weather information is ready
 * to be processed.
 */
- (void)dataRecivedFromWeatherService: (NSString *)newData;
/**
 * Signal from Connection that fetching weather information has failed.
 * @param error The error received from the network or server.
 */
- (void)searchingWeatherInfoFailedWithError: (NSError *)error;

@end
