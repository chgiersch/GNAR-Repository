//
//  Game.m
//  GNAR
//
//  Created by  on 12/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "Game.h"

@implementation Game

@synthesize startDate, endDate, totalScore, gnarScores, friends, resorts, gameID;

-(id)initWithName:(NSDate*) _startDate:(NSDate*)_endDate:(int)_totalScore:(NSMutableArray*)_gnarScores:(int)_gameID
{
    self = [super init];
    if (self)
    {
        [self setStartDate:_startDate];
        [self setEndDate:_endDate];
        [self setTotalScore:_totalScore];
        [self setGnarScores:_gnarScores];
        [self setGameID:_gameID];
    }
    return self;
}


@end
