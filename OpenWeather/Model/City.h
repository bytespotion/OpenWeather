//
//  City.h
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/11/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface City : NSObject

@property (readonly) NSString *name;
@property (readonly) NSUInteger code;
@property (nonatomic, assign) BOOL enabled;

- (id)initWithName:(NSString *)name code:(NSUInteger)code;
@end
