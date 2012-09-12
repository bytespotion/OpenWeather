//
//  WeatherImageConnectionDelegate.h
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/11/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol WeatherImageConnectionDelegate <NSObject>

/**
 * Finds the image corresponding to the code pased and loads it in 
 * image.
 */
- (void)loadImage:(UIImage **)image withCode:(NSUInteger)code;

@end
