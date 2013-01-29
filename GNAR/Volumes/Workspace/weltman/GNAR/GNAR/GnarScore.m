//
//  GnarScore.m
//  GNAR
//
//  Created by  on 12/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GnarScore.h"

@implementation GnarScore

@synthesize name, score, date, dateString, scoreType;

-(id)initWithName:(NSString*) _name: (int) _score: (NSDate*)_date: (NSString*)_scoreType
{
   self = [super init];
    if (self)
    {
        [self setName:_name];
        [self setScore:_score];
        [self setDate:_date];
        [self setScoreType:_scoreType];
        
        
        NSDateFormatter *format = [NSDateFormatter alloc];
        [format setDateFormat:@"yyyy-MM-dd"];

        NSString *newDateString = [format stringFromDate:date];
        [self setDateString:newDateString];
        
    }
    return self;
}

@end