//
//  GnarScore.m
//  GNAR
//
//  Created by  on 12/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GnarScore.h"

@implementation GnarScore

@synthesize name, score, date, dateString, scoreType, scoreID;

-(id)initWithName:(NSString*)_name: (int)_score: (NSDate*)_date: (NSString*)_scoreType :(int) _scoreID
{
   self = [super init];
    if (self)
    {
        [self setName:_name];
        [self setScore:_score];
        [self setDate:_date];
        [self setScoreType:_scoreType];
        [self setScoreID: _scoreID];
        
        
        NSDateFormatter *format = [NSDateFormatter alloc];
        [format setDateFormat:@"yyyy-MM-dd"];

        NSString *newDateString = [format stringFromDate:date];
        [self setDateString:newDateString];
        
    }
    return self;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        [self setName:@"Default Name"];
        [self setScore:0];
        [self setDate: [NSDate date]];
        [self setScoreType: @"Unknown"];
        [self setScoreID: 0];
        
        
       /* NSDateFormatter *format = [NSDateFormatter alloc];
        [format setDateFormat:@"yyyy-MM-dd"];
        
        NSString *newDateString = [format stringFromDate:self.date];
        [self setDateString:newDateString];*/
    }
    return self;
}

@end