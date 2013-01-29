//
//  ExtraPoints.m
//  GNAR
//
//  Created by  on 12/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ExtraPoints.h"

@implementation ExtraPoints

@synthesize abbreviation;

-(id)initWithName:(NSString*) abb
{
    self = [super init];
    if (self)
    {
        [self setAbbreviation:abb];
    }
    return self;
}


@end
