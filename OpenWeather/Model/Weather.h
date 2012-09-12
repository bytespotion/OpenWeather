//
//  Weather.h
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/10/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Weather : NSObject

@property (readonly) NSString *city;
@property (readonly) NSUInteger temperature;
@property (nonatomic, retain) NSString *condition;
@property (assign) NSInteger image;
@property (nonatomic, retain) NSString *description;

- (id)initWithCity:(NSString *)city temperature:(int)temperature;

@end
