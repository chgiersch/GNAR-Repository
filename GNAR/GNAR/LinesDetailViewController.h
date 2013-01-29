//
//  LinesDetailViewController.h
//  GNAR
//
//  Created by  on 12/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LineWorth.h"
#import "MainTabController.h"

@interface LinesDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UISegmentedControl *segButton;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *difficultyField;
@property (weak, nonatomic) IBOutlet UILabel *funField;
@property (weak, nonatomic) IBOutlet UILabel *heroField;
@property int points;
@property NSString* scoreName;
@property LineWorth* pointToAdd;
@property NSMutableDictionary* pointsDictionary;
@property int lowScore;
@property int medScore;
@property int highScore;

@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;

-(void) addToScores:(LineWorth*)newPoint;

- (IBAction)segValueChanged:(UISegmentedControl *)sender;
@end
