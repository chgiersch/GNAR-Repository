//
//  Game.h
//  GNAR
//
//  Created by  on 12/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GnarScore.h"
#import "LineWorth.h"
#import "ExtraPoints.h"
@class Game;
@interface Game : NSObject

@property NSDate* startDate;
@property NSDate* endDate;
@property int totalScore;
@property NSMutableArray* gnarScores;
@property NSMutableArray* friends;
@property NSMutableArray* resorts;
@property int gameID;
@end
