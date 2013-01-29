//
//  ECPDetailViewController.h
//  GNAR
//
//  Created by  on 12/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExtraPoints.h"

@interface ECPDetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *abb;
@property (weak, nonatomic) IBOutlet UILabel *pointsLabel;
@property (weak, nonatomic) IBOutlet UILabel *stepperLabel;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property int points;
@property NSString* scoreName;
@property ExtraPoints* pointToAdd;
@property NSMutableDictionary* pointsDictionary;
@property int trickPointsToGet;


- (IBAction)valueChanged:(UIStepper *)sender;
-(void) addToScores:(ExtraPoints*)newPoint;
@end
