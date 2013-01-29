//
//  LineWorth.m
//  GNAR
//
//  Created by  on 12/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LineWorth.h"

@implementation LineWorth
@synthesize area, snow, modifiers;

-(id)initWithName:(NSString*) _area:(NSString*)_snow:(NSMutableArray*)_modifiers
{
    self = [super init];
    if (self)
    {
        [self setArea:_area];
        [self setSnow:_snow];
        [self setModifiers:_modifiers];
    }
    return self;
}

@end
