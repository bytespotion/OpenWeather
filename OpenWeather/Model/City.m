//
//  City.m
//  OpenWeather
//
//  Created by Guillem Fernández González on 9/11/12.
//  Copyright (c) 2012 Guillem Fernández González. All rights reserved.
//

#import "City.h"

@implementation City

@synthesize name = _name;
@synthesize code = _code;
@synthesize enabled = _enabled;

- (id)initWithName:(NSString *)name code:(NSUInteger)code
{
    if (self = [super init]) {
        _name = name;
        _code = code;
        _enabled = NO;
    }
    
    return self;
}
@end
