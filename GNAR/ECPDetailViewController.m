//
//  ECPDetailViewController.m
//  GNAR
//
//  Created by  on 12/15/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ECPDetailViewController.h"
#import "MainTabController.h"
#import "ScoresViewController.h"

@interface ECPDetailViewController ()

@end

@implementation ECPDetailViewController
@synthesize textView;
@synthesize abb;
@synthesize pointsLabel;
@synthesize stepperLabel;
@synthesize stepper;
@synthesize pointToAdd, points, scoreName, pointsDictionary, trickPointsToGet;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (pointsDictionary != nil)
    {
        points = [[pointsDictionary objectForKey:@"Points"] intValue];
        pointsLabel.text = [[pointsDictionary objectForKey:@"Points"] stringValue];
        abb.text = [pointsDictionary objectForKey:@"Abbreviation"];
        textView.text = [pointsDictionary objectForKey:@"Description"];
    }
	else 
    {
        pointsLabel.text = [[NSString alloc] initWithFormat:@"%i", points];
        textView.text = @"";
        abb.text = self.title;
    }
}

- (void)viewDidUnload
{
    [self setAbb:nil];
    [self setPointsLabel:nil];
    [self setStepperLabel:nil];
    [self setStepper:nil];
    [self setTextView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)valueChanged:(UIStepper *)sender {
    double value = [sender value];
    
    [stepperLabel setText:[NSString stringWithFormat:@"%d", (int)value]];
}
-(void) addToScores:(ExtraPoints*)newPoint
{
    MainTabController* main = (MainTabController*)self.tabBarController;
    [main.myGame.gnarScores addObject: newPoint];
    NSLog(@"%d", [main.myGame.gnarScores count]);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{ 
   
    if ([segue.identifier isEqualToString:@"LoadScoresList"])
    {
        pointToAdd = [[ExtraPoints alloc] init];
        pointToAdd.name = self.title;
        pointToAdd.date = [NSDate date];
        pointToAdd.score = points;
        pointToAdd.scoreID = 1;
        pointToAdd.scoreType = @"";
        pointToAdd.abbreviation = abb.text;
        for (int i =0; i<stepper.value; i++)
        {
            [self addToScores:pointToAdd];
        }
    }
}

@end
