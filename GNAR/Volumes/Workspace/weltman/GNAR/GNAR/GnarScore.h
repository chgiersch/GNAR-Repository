//
//  GnarScore.h
//  GNAR
//
//  Created by  on 12/5/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GnarScore : NSObject

@property (strong, nonatomic) NSString* name;
@property int score;
@property (strong, nonatomic) NSDate* date;
@property (strong, nonatomic) NSString* dateString;
@property (strong, nonatomic) NSString* scoreType;

@end
